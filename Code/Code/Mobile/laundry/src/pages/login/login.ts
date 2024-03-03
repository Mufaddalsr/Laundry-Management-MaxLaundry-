import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams, App, LoadingController, ToastController } from 'ionic-angular';
import { RegisterPage } from '../register/register';
import { HomePage } from '../home/home';
import { MenuPage } from '../menu/menu';
import { ApiServiceProvider } from '../../providers/api-service/api-service';
/**
 * Generated class for the LoginPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-login',
  templateUrl: 'login.html',
})
export class LoginPage {

  phoneNumber: string = "";
  password: string = "";
  rememberMe: boolean = true;

  constructor(public loadingController: LoadingController, public toastCtrl: ToastController,
    public apiService: ApiServiceProvider, public _app: App, public navCtrl: NavController,
    public navParams: NavParams) {
  }

  ionViewDidLoad() {
    this.phoneNumber = localStorage.getItem("phoneNumber") || "";
    this.password = localStorage.getItem("password") || "";
  }
  validatePhone(phone) {
    var filter = /^[0-9]*$/;
    return filter.test(phone);
  }

  registerModal() {
    this.navCtrl.push(RegisterPage);
  }

  fnloadHome() {
    this._app.getRootNav().setRoot(MenuPage);
  }

  loginForm() {
    if (this.phoneNumber == "" && this.password == "") {
      let toast = this.toastCtrl.create({
        position: 'bottom',
        message: 'MoblieNo and password both are required.',
        duration: 3000,
        cssClass: "toast-error"
      });
      toast.present();
      return;
    }
    if (!this.validatePhone(this.phoneNumber)) {
      let tostr = this.toastCtrl.create({
        position: 'bottom',  
        message: 'Please enter valid phone number.',
        duration: 2000,
        cssClass: "toast-error",
      });
      tostr.present();
      return
    }

    if (this.rememberMe) {
      localStorage.setItem("phoneNumber", this.phoneNumber);
      localStorage.setItem("password", this.password);
    }
    else {
      localStorage.setItem("phoneNumber", "");
      localStorage.setItem("password", "");
    }
    var loaderToShow = this.loadingController.create({
      content: 'Please wait...'
    })
    loaderToShow.present().then(() => {
      this.apiService.login(this.phoneNumber, this.password).subscribe(response => {
        loaderToShow.dismiss().then(() => {
          if (response.success == "Wrong") {
            let toast = this.toastCtrl.create({
              position: 'bottom',
              message: 'Invalid phoneNumber or password.',
              duration: 3000,
              cssClass:"toast-error"
            });
            toast.present();
          }
          else {
            localStorage.setItem("id", response.id);
            localStorage.setItem("idString", response.idString);
            localStorage.setItem("customerName", response.fullName);
            this._app.getRootNav().setRoot(MenuPage);
          }
        });
      });
    });
  }
}
