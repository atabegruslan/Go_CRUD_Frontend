package controllers

import (
	"github.com/astaxie/beego"
	"net/http"
    "io/ioutil"
	"beegoing_front/models"
	"encoding/json"
	//"fmt"
)

type PlaceController struct {
	beego.Controller
}

func (this *PlaceController) ListPlaces() {
	//response := http.Get("http://localhost:8082/v1/places")
    response, _ := http.Get("https://jsonplaceholder.typicode.com/posts")
    data, _ := ioutil.ReadAll(response.Body)

	var places []models.Place
	json.Unmarshal(data, &places)

beego.SetLogger("file", `{"filename":"logs/log.log"}`)
beego.Debug(data)
beego.Debug(places)

	this.TplName = "places.tpl"
	this.Data["places"] = places

	//this.ServeJSON()
}

func (this *PlaceController) NewPlace() {

}
