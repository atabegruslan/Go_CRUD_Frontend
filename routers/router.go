package routers

import (
	"beegoing_front/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
	beego.Router("/place/", &controllers.PlaceController{}, "get:ListPlaces;post:NewPlace")
}
