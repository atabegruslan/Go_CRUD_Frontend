package controllers

import (
	"github.com/astaxie/beego"
	"net/http"
    "io/ioutil"
	"beegoing_front/models"
	"encoding/json"
	//"fmt"
	"bytes"
	//"strconv"
)

type PlaceController struct {
	beego.Controller
}

func (this *PlaceController) ListPlaces() {
	response, _ := http.Get("http://localhost:8082/v1/places")
    data, _ := ioutil.ReadAll(response.Body)

	var places []models.Place
	json.Unmarshal(data, &places)

	this.TplName = "places.tpl"
	this.Data["places"] = places
}

func (this *PlaceController) NewPlace() {
	// var place models.Place
	// json.Unmarshal(this.Ctx.Input.RequestBody, &place)

	place := models.Place{}
    this.ParseForm(&place)

	jsonStr, _ := json.Marshal(place)
	data := bytes.NewBuffer(jsonStr)

    req, _ := http.NewRequest("POST", "http://localhost:8082/v1/places", data)
    req.Header.Set("Content-Type", "application/json")

    client := &http.Client{}
    client.Do(req)

	this.Redirect("/place", 302)
}

func (this *PlaceController) GetPlace() {

}

func (this *PlaceController) UpdatePlace() {
	id := this.Ctx.Input.Param(":id")
	beego.Info("Place to be updated has an ID of: ", id)
	// intid, _ := strconv.ParseInt(id, 10, 64)

	place := models.Place{}
    this.ParseForm(&place)

	jsonStr, _ := json.Marshal(place)
	data := bytes.NewBuffer(jsonStr)

    req, _ := http.NewRequest("PUT", "http://localhost:8082/v1/places/" + id, data)
    req.Header.Set("Content-Type", "application/json")

    client := &http.Client{}
    client.Do(req)

	this.Redirect("/place", 302)
}

func (this *PlaceController) DeletePlace() {

}
