import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,LoadingController,ToastController } from 'ionic-angular';
import { ApiServiceProvider } from '../../providers/api-service/api-service';
/**
 * Generated class for the ProfilePage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-profile',
  templateUrl: 'profile.html',
})
export class ProfilePage {

  newpassword = "";
  oldpassword = "";
  email= "";
  fullName= "";
  address="";
  mobileNumber="";
  phoneNumber="";

  segmentSelected:string = "editProfile";
  constructor(public navCtrl: NavController, public navParams: NavParams,public loadingController: LoadingController,
          public apiService: ApiServiceProvider,public toastCtrl:ToastController) {
  }

  ionViewDidLoad() {
    var loaderToShow = this.loadingController.create({
      content: 'Please wait...'
    })
    loaderToShow.present().then(() => {
      this.apiService.getCustomerProfile().subscribe(response=>{
        loaderToShow.dismiss().then(() => {
          this.email = response.email;
          this.fullName = response.fullName;
          this.mobileNumber = response.mobileNumber;
          this.phoneNumber = response.phoneNumber;
          this.address = response.address;
          // this.description = response.description;
        });
      });
    });
  }

  updateProfile(){
    if(this.email == "" && this.fullName == "" && this.phoneNumber == "" && this.address == ""){
      let toast = this.toastCtrl.create({
        position:"bottom",
        duration:2000,
        cssClass:"toast-error",
        message :"All fields are required."
      });
      toast.present();
      return;
    }
    var loaderToShow = this.loadingController.create({
      content: 'Please wait...'
    })
    loaderToShow.present().then(() => {
      this.apiService.updateCustomerProfile(this.fullName,this.email,this.phoneNumber,
                                            this.mobileNumber,this.address).subscribe(response=>{
        loaderToShow.dismiss().then(() => {
          if(response.success == "Is Exist"){
            let toast = this.toastCtrl.create({
              position:"bottom",
              duration:2000,
              cssClass:"toast-error",
              message :"Email address already exist."
            });
            toast.present();
          }
          else if(response.success) {
            let toast = this.toastCtrl.create({
              position:"bottom",
              duration:2000,
              cssClass:"toast-success",
              message :"Profile changed successfully."
            });
            toast.present();
          }
        });
      },error => {
        loaderToShow.dismiss().then(() => {
          var errosMessage = "";
          var errors = error.error.errors;

        });
      })
    });
  }

  changePassword(){
    if(this.oldpassword != "" && this.newpassword){
      var loaderToShow = this.loadingController.create({
        content: 'Please wait...'
      })
      loaderToShow.present().then(() => {
        this.apiService.changepassword(this.oldpassword,this.newpassword).subscribe((response)=>{
          loaderToShow.dismiss().then(() => {
            if(response.success){
              let toast = this.toastCtrl.create({
                position:"bottom",
                duration:2000,
                cssClass:"toast-success",
                message :"Your password changed successfully."
              });
              toast.present();
            }
            else{
              let toast = this.toastCtrl.create({
                position:"bottom",
                duration:2000,
                cssClass:"toast-error",
                message :"Old password is wrong."
              });
              toast.present();
            }
          });
        });
      });
    }
    else{
      let toast = this.toastCtrl.create({
        position:"bottom",
        duration:2000,
        cssClass:"toast-error",
        message :"Old password and new password both are required."
      });
      toast.present();
    }
  }
  segmentChanged(e){
   
  }
}
