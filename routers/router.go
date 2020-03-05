package routers

import (
	"beegoing_front/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
	beego.Router("/place/", &controllers.PlaceController{}, "get:ListPlaces;post:NewPlace")
	beego.Router("/place/:id:int", &controllers.PlaceController{}, "get:GetPlace;put:UpdatePlace;delete:DeletePlace")
}
