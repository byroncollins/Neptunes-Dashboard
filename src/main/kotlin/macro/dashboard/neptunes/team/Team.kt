package macro.dashboard.neptunes.team

import macro.dashboard.neptunes.GeneralException
import macro.dashboard.neptunes.game.Game
import macro.dashboard.neptunes.game.GameTable
import macro.dashboard.neptunes.player.Player
import macro.dashboard.neptunes.player.PlayerTable

/**
 * Created by Macro303 on 2018-Nov-08.
 */
data class Team(
	val ID: Int,
	val gameID: Long,
	var name: String
) {

	val game: Game by lazy{
		GameTable.select(ID = gameID) ?: throw GeneralException()
	}
	val players: List<Player> by lazy{
		PlayerTable.searchByTeam(teamID = ID)
	}

	val totalEconomy: Int by lazy{
		players.sumBy { it.latestTurn.economy }
	}
	val totalIndustry: Int by lazy{
		players.sumBy { it.latestTurn.industry }
	}
	val totalScience: Int by lazy{
		players.sumBy { it.latestTurn.science }
	}
	val totalStars: Int by lazy{
		players.sumBy { it.latestTurn.stars }
	}
	val totalFleet: Int by lazy{
		players.sumBy { it.latestTurn.fleet }
	}
	val totalShips: Int by lazy{
		players.sumBy { it.latestTurn.ships }
	}

	fun toOutput(showGame: Boolean, showPlayers: Boolean): Map<String, Any> {
		val output = mapOf(
			"ID" to ID,
			"name" to name,
			"game" to gameID,
			"players" to players.map { it.ID },
			"totalEconomy" to totalEconomy,
			"totalIndustry" to totalIndustry,
			"totalScience" to totalScience,
			"totalStars" to totalStars,
			"totalFleet" to totalFleet,
			"totalShips" to totalShips
		).toMutableMap()
		if (showGame)
			output["game"] = game.toOutput()
		if (showPlayers)
			output["players"] = players.map { it.toOutput(showGame = false, showTeam = false) }
		return output.toSortedMap()
	}
}
