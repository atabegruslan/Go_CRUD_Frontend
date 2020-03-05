package main

import (
	_ "beegoing_front/routers"
	"github.com/astaxie/beego"
)

func main() {
	beego.SetLogger("file", `{"filename":"logs/log.log"}`)
	beego.Run()
}

