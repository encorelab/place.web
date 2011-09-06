<div id="login-form">
	<form action="?action=home" method="post">
		<span class="label">Username: </span><input type="text" value="" id="username" name="username"/>
		<br/><span class="label">Password: </span><input type="password" value="" id="password" name="password"/>
		<br/><br/>
		Log in as: 
		<select name="profile" id="profile">
			<option value="TEACHER">Teacher</option>
			<option value="STUDENT">Student</option>
		</select>
		<br/><br/>
		<input type="submit" value="Login"/>
	</form>
</div>