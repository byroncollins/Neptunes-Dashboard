<!DOCTYPE html>
<html lang="en">
<head>
	<title>BIT 269's Neptune's Pride</title>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="/styles.css" rel="stylesheet"/>
</head>
<body>
<header>
	<ul class="sidenav sidenav-fixed blue-grey darken-4">
		<li>
			<div class="user-view">
				<img class="circle left" src="/favicon.ico">
				<span class="grey-text name">BIT 269</span>
				<span class="grey-text email">Neptune's Pride</span>
			</div>
		</li>
		<li>
			<a class="orange-text text-lighten-4" href="/">
				<i class="material-icons orange-text text-lighten-4">home</i>Home
			</a>
		</li>
		<li>
			<a class="orange-text text-lighten-4" href="/game">
				<i class="material-icons orange-text text-lighten-4">games</i>Game
			</a>
		</li>
		<li>
			<a class="orange-text text-lighten-4" href="/players">
				<i class="material-icons orange-text text-lighten-4">person</i>Players
			</a>
		</li>
		<li>
			<a class="orange-text text-lighten-4" href="/players/leaderboard">
				<i class="material-icons orange-text text-lighten-4">list</i>Player Leaderboard
			</a>
		</li>
		<li>
			<a class="orange-text text-lighten-4" href="/teams">
				<i class="material-icons orange-text text-lighten-4">group</i>Teams
			</a>
		</li>
		<li class="active">
			<a class="orange-text text-lighten-2" href="/teams/leaderboard">
				<i class="material-icons orange-text text-lighten-2">list</i>Team Leaderboard
			</a>
		</li>
		<li>
			<a class="orange-text text-lighten-4" href="/config">
				<i class="material-icons orange-text text-lighten-4">settings</i>Settings
			</a>
		</li>
		<li>
			<a class="orange-text text-lighten-4" href="/help">
				<i class="material-icons orange-text text-lighten-4">help</i>Help
			</a>
		</li>
	</ul>
</header>
<div style="margin-right: 10px; padding-right: 10px;">
	<table class="blue-grey darken-2 grey-text text-lighten-2 opacity">
		<thead>
			<tr>
				<th><a class="btn-flat blue-text" href="?sort=Name">Name</a></th>
				<th><a class="btn-flat blue-text" href="?sort=Stars">Stars</a></th>
				<th><a class="btn-flat blue-text" href="?sort=Ships">Ships</a></th>
				<th><a class="btn-flat blue-text" href="?sort=Economy">Economy</a></th>
				<th><a class="btn-flat blue-text disabled">$/Turn</a></th>
				<th><a class="btn-flat blue-text" href="?sort=Industry">Industry</a></th>
				<th><a class="btn-flat blue-text disabled">Ships/Turn</a></th>
				<th><a class="btn-flat blue-text" href="?sort=Science">Science</a></th>
			</tr>
		</thead>
		<tbody>
			<#list leaderboard as team>
				<tr>
					<td>${team.name!"Unknown"}</td>
					<td>${team.totalStars!"0"}</td>
					<td>${team.totalShips!"0"}</td>
					<td>${team.totalEconomy!"0"}</td>
					<td>${team.economyTurn!"0"}</td>
					<td>${team.totalIndustry!"0"}</td>
					<td>${team.industryTurn!"0"}</td>
					<td>${team.totalScience!"0"}</td>
				</tr>
			</#list>
		</tbody>
	</table>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>