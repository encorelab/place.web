var labelType, useGradients, nativeTextSupport, animate;

(function() {
  var ua = navigator.userAgent,
      iStuff = ua.match(/iPhone/i) || ua.match(/iPad/i),
      typeOfCanvas = typeof HTMLCanvasElement,
      nativeCanvasSupport = (typeOfCanvas == 'object' || typeOfCanvas == 'function'),
      textSupport = nativeCanvasSupport 
        && (typeof document.createElement('canvas').getContext('2d').fillText == 'function');
  //I'm setting this based on the fact that ExCanvas provides text support for IE
  //and that as of today iPhone/iPad current text support is lame
  labelType = (!nativeCanvasSupport || (textSupport && !iStuff))? 'Native' : 'HTML';
  nativeTextSupport = labelType == 'Native';
  useGradients = nativeCanvasSupport;
  animate = !(iStuff || !nativeCanvasSupport);
})();

var Log = {
  elem: false,
  write: function(text){
    if (!this.elem) 
      this.elem = document.getElementById('log');
    this.elem.innerHTML = text;
    this.elem.style.left = (500 - this.elem.offsetWidth / 2) + 'px';
  }
};


function init(){
    //init data
    var json = {
        "id": "347_0",
        "name": "Physics Learning Across Contexts and Environments",
        "children": [{
            "id": "126510_1",
            "name": "Runs",
            "data": {
                "elo": "physics",
                "relation": "run id"
            },
            "children": [{
                "id": "52163_2",
                "name": "run1",
                "data": {
                    "elo": "Runs",
                    "relation": "run id"
                },
                "children": []
            }, {
                "id": "324134_3",
                "name": "run2",
                "data": {
                    "elo": "Runs",
                    "relation": "run id"
                },
                "children": []
            }]
        }, {
            "id": "173871_4",
            "name": "ELO1",
            "data": {
                "elo": "physics",
                "relation": "elo type"
            },
            "children": []
        }, {
            "id": "235952_5",
            "name": "ELO2",
            "data": {
                "elo": "physics",
                "relation": "elo type"
            },
            "children": []
        }, {
            "id": "235951_6",
            "name": "Users",
            "data": {
                "elo": "physics",
                "relation": "user type"
            },
            "children": [{
                "id": "2382_7",
                "name": "admin",
                "data": {
                    "elo": "physics",
                    "relation": "user type"
                },
                "children": []
            }, {
                "id": "2415_8",
                "name": "teacher",
                "data": {
                    "elo": "physics",
                    "relation": "user type"
                },
                "children": []
            }, {
                "id": "3963_9",
                "name": "student1",
                "data": {
                    "elo": "physics",
                    "relation": "user type"
                },
                "children": []
            }, {
                "id": "7848_10",
                "name": "student2",
                "data": {
                    "elo": "physics",
                    "relation": "user type"
                },
                "children": []
            }]
        }, {
            "id": "235950_11",
            "name": "votable",
            "data": {
                "elo": "physics",
                "relation": "elo type"
            },
            "children": [{
                "id": "1007_12",
                "name": "comments",
                "data": {
                    "elo": "physics",
                    "relation": "elo type"
                },
                "children": []
            }, {
                "id": "327924_13",
                "name": "answers",
                "data": {
                    "elo": "physics",
                    "relation": "elo type"
                },
                "children": []
            }]
        }, {
            "id": "2396_14",
            "name": "activity votes",
            "data": {
                "elo": "physics",
                "relation": "elo type"
            },
            "children": [{
                "id": "3963_15",
                "name": "voted on comment",
                "data": {
                    "elo": "physics",
                    "relation": "elo type"
                },
                "children": []
            }, {
                "id": "32247_16",
                "name": "voted on answer",
                "data": {
                    "elo": "physics",
                    "relation": "elo type"
                },
                "children": []
            }, {
                "id": "83761_17",
                "name": "voted on answer concept",
                "data": {
                    "elo": "physics",
                    "relation": "elo type"
                },
                "children": []
            }, {
                "id": "133257_18",
                "name": "voted on example concept",
                "data": {
                    "elo": "physics",
                    "relation": "elo type"
                },
                "children": []
            }]
        }, {
            "id": "36352_19",
            "name": "activity types",
            "data": {
                "elo": "physics",
                "relation": "elo type"
            },
            "children": [{
                "id": "1013_20",
                "name": "commented on comment",
                "data": {
                    "elo": "physics",
                    "relation": "elo type"
                },
                "children": []
            }, {
                "id": "3963_21",
                "name": "commented on answer",
                "data": {
                    "elo": "physics",
                    "relation": "elo type"
                },
                "children": []
            }, {
                "id": "5752_22",
                "name": "commented on example",
                "data": {
                    "elo": "physics",
                    "relation": "elo type"
                },
                "children": []
            }, {
                "id": "33602_23",
                "name": "assessed comment",
                "data": {
                    "elo": "physics",
                    "relation": "elo type"
                },
                "children": []
            }, {
                "id": "40485_24",
                "name": "assessed example",
                "data": {
                    "elo": "physics",
                    "relation": "elo type"
                },
                "children": []
            }, {
                "id": "133257_25",
                "name": "assessed answer",
                "data": {
                    "elo": "physics",
                    "relation": "elo type"
                },
                "children": []
            }]
        }, {
            "id": "236021_26",
            "name": "ELO3",
            "data": {
                "elo": "physics",
                "relation": "elo type"
            },
            "children": []
        }, {
            "id": "236024_27",
            "name": "commentable",
            "data": {
                "elo": "physics",
                "relation": "elo type"
            },
            "children": [{
                "id": "909_28",
                "name": "comments",
                "data": {
                    "elo": "physics",
                    "relation": "elo type"
                },
                "children": []
            }, {
                "id": "237377_29",
                "name": "answers",
                "data": {
                    "elo": "physics",
                    "relation": "elo type"
                },
                "children": []
            }]
        }, {
            "id": "235953_30",
            "name": "assessable",
            "data": {
                "elo": "physics",
                "relation": "elo type"
            },
            "children": [{
                "id": "1440_31",
                "name": "comments",
                "data": {
                    "elo": "physics",
                    "relation": "elo type"
                },
                "children": []
            }]
        }, {
            "id": "235955_32",
            "name": "ELO4",
            "data": {
                "elo": "physics",
                "relation": "elo type"
            },
            "children": [{
                "id": "909_33",
                "name": "ELO4.1",
                "data": {
                    "elo": "ELO4",
                    "relation": "elo type"
                },
                "children": []
            }, {
                "id": "1695_34",
                "name": "ELO4.2",
                "data": {
                    "elo": "ELO4",
                    "relation": "elo type"
                },
                "children": []
            }, {
                "id": "1938_35",
                "name": "ELO4.3",
                "data": {
                    "elo": "ELO4",
                    "relation": "elo type"
                },
                "children": []
            }, {
                "id": "5138_36",
                "name": "ELO4.4",
                "data": {
                    "elo": "ELO4",
                    "relation": "elo type"
                },
                "children": []
            }, {
                "id": "53549_37",
                "name": "ELO4.5",
                "data": {
                    "elo": "ELO4",
                    "relation": "elo type"
                },
                "children": []
            }, {
                "id": "113510_38",
                "name": "ELO4.6",
                "data": {
                    "elo": "ELO4",
                    "relation": "elo type"
                },
                "children": []
            }, {
                "id": "113512_39",
                "name": "ELO4.7",
                "data": {
                    "elo": "ELO4",
                    "relation": "elo type"
                },
                "children": []
            }]
        }],
        "data": []
    };
    //end
    var infovis = document.getElementById('infovis');
    var w = infovis.offsetWidth - 50, h = infovis.offsetHeight - 50;
    
    //init Hypertree
    var ht = new $jit.Hypertree({
      //id of the visualization container
      injectInto: 'infovis',
      //canvas width and height
      width: w,
      height: h,
      //Change node and edge styles such as
      //color, width and dimensions.
      Node: {
          dim: 9,
          color: "#DD9E37"
      },
      Edge: {
          lineWidth: 2,
          color: "#DBDBDB"
      },
      onBeforeCompute: function(node){
          Log.write("centering");
      },
      //Attach event handlers and add text to the
      //labels. This method is only triggered on label
      //creation
      onCreateLabel: function(domElement, node){
          domElement.innerHTML = node.name;
          $jit.util.addEvent(domElement, 'click', function () {
              ht.onClick(node.id);
          });
      },
      //Change node styles when labels are placed
      //or moved.
      onPlaceLabel: function(domElement, node){
          var style = domElement.style;
          style.display = '';
          style.cursor = 'pointer';
          if (node._depth <= 1) {
              style.fontSize = "0.8em";
              style.color = "#555";

          } else if(node._depth == 2){
              style.fontSize = "0.7em";
              style.color = "#555";

          } else {
              style.display = 'none';
          }

          var left = parseInt(style.left);
          var w = domElement.offsetWidth;
          style.left = (left - w / 2) + 'px';
      },
      
      onAfterCompute: function(){
          Log.write("done");
          
          //Build the right column relations list.
          //This is done by collecting the information (stored in the data property) 
          //for all the nodes adjacent to the centered node.
          var node = ht.graph.getClosestNodeToOrigin("current");
          var html = "<h4>" + node.name + "</h4><b>Connections:</b>";
          html += "<ul>";
          node.eachAdjacency(function(adj){
              var child = adj.nodeTo;
              if (child.data) {
                  var rel = (child.data.band == node.name) ? child.data.relation : node.data.relation;
                  html += "<li>" + child.name + " " + "<div class=\"relation\">(relation: " + rel + ")</div></li>";
              }
          });
          html += "</ul>";
          $jit.id('inner-details').innerHTML = html;
      }
    });
    //load JSON data.
    ht.loadJSON(json);
    //compute positions and plot.
    ht.refresh();
    //end
    ht.controller.onAfterCompute();
}
