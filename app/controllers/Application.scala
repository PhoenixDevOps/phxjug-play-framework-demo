package controllers

import play.api._
import play.api.mvc._

class Application extends Controller {

  def index = Action {
    Ok(views.html.index("Your new application is ready."))
  }

  def version = Action {
    Ok("Version 1.4")
  }

  def health = Action {
    Ok("I'm doing just fine!")
  }

}
