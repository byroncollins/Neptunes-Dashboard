package macro.dashboard.neptunes

import io.ktor.http.ContentType

/**
 * Created by Macro303 on 2019-Feb-13.
 */
data class InvalidContentTypeException(val value: ContentType) : RuntimeException(){
	override fun toString(): String {
		return "To access this endpoint the header Content-Type needs to be ${ContentType.Application.Json}, you supplied $value"
	}
}
data class InvalidBodyException(val field: String) : RuntimeException(){
	override fun toString(): String {
		return "$field is required as not null"
	}
}

data class DataExistsException(val field: String, val value: Any?): RuntimeException(){
	override fun toString(): String {
		return "$field should be unique, $value already exists in the database"
	}
}

data class DataNotFoundException(val errorMessage: String): RuntimeException(){
	constructor(type: String, field: String, value: Any?): this(errorMessage = "No $type was found with the $field: $value in the database")
}

data class NotImplementedException(val ignored: Nothing? = null): RuntimeException(){
	override fun toString(): String {
		return "This endpoint hasn't been implemented yet, feel free to make a pull request and add it."
	}
}

data class GeneralException(val ignored: Nothing? = null): RuntimeException(){
	override fun toString(): String {
		return "Something happened check the logs, contact the devs, call the wizard"
	}
}

data class AuthorizationException(val ignored: Nothing? = null): RuntimeException(){
	override fun toString(): String {
		return "You are not authorized to access this endpoint"
	}
}

data class UnknownException(override val message: String): RuntimeException()

data class BadRequestException(override val message: String): RuntimeException()
data class UnauthorizedException(override val message: String): RuntimeException()
data class NotFoundException(override val message: String): RuntimeException()
data class ConflictException(override val message: String): RuntimeException()