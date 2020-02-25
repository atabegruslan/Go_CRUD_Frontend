package controllers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/httplib"
)

type PlaceController struct {
	beego.Controller
}

func (this *PlaceController) ListPlaces() {
	res := httplib.Get("http://localhost:8082/v1/places")
	str, _ := res.String()

	this.TplName = "places.tpl"
	this.Data["json"] = str
	this.ServeJSON()
}

func (this *PlaceController) NewPlace() {

}
