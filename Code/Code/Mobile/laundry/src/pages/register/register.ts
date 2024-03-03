import { Component,ViewChild } from '@angular/core';
import { IonicPage, NavController, NavParams,AlertController,LoadingController,ToastController } from 'ionic-angular';
import { ApiServiceProvider } from '../../providers/api-service/api-service';
import { IonicStepperComponent } from "ionic-stepper";
import{ LoginPage } from '../login/login';
import { Geolocation } from '@ionic-native/geolocation';

/**
 * Generated class for the RegisterPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-register',
  templateUrl: 'register.html',
})
export class RegisterPage {
  stepMode:string = 'vertical';
  selectedIndex = 0;

  id:number=0;
  idString:string="";
  fullName:string="";
  email:string = "";
  phone:string ="";
  address:string ="";
  mode:number=0;
  mobileNumber:string="";
  companyID:number=1;
  corpID:number = 1;
  Longtitude = 0;
  Latitude = 0;

  @ViewChild('stepper') stepper: IonicStepperComponent;
  constructor(public apiService: ApiServiceProvider,public navCtrl: NavController, 
            public navParams: NavParams,public loadingController: LoadingController,
            public toastrCtrl:ToastController,private geolocation: Geolocation) {
  }

  ionViewDidLoad() {
  }

  validatePhone(phone)
  {
    var filter = /^[0-9]*$/;
    return filter.test(phone);
  }

  validateEmail(sEmail) {
    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    return filter.test(sEmail);
  }

  savePhoneNumber()
  {
    if(this.phone == ""){
      let toastr = this.toastrCtrl.create({
        message:"Please enter your phone number.",
        position: 'bottom',
        duration: 3000,
        cssClass: "toast-error",
      });
      toastr.present();
      return
    }
    if (!this.validatePhone(this.phone)) {
		  let tostr = this.toastrCtrl.create({
			position: 'bottom',
			message: 'Please enter valid phone number.',
			duration: 2000,
			cssClass: "toast-error",
		  });
		  tostr.present();
		  return
		}

    var loaderToShow = this.loadingController.create({
      content:"Please wait..."
    });

    loaderToShow.present().then(()=>{
      this.apiService.registerPhoneNumber(this.phone).subscribe(response => {
        loaderToShow.dismiss().then(()=>{
          this.id=response.id;
          this.idString=response.idString;
          this.fullName = response.fullName;
          this.mobileNumber = response.mobileNumber;
          this.email = response.email;
          this.address=response.address;
          this.mode=response.mode;
          this.companyID = response.companyID;
          this.corpID=response.corpID
        });
        this.stepper.nextStep();
      });
    });
  }

  updateOrSaveDetails()
  {
    if(this.fullName == "" && this.email == "") {
      let toastr = this.toastrCtrl.create({
        message:"Please fill all required fields.",
        position: 'bottom',
        duration: 3000,
        cssClass: "toast-error",
      });
      toastr.present();
      return
    }
   
    var loaderToShow = this.loadingController.create({
      content:"Please wait..."
    });

    loaderToShow.present().then(()=>{
      this.apiService.register(this.id,this.idString,this.fullName,this.email,this.phone,this.address,this.mode,
                              1,1,this.mobileNumber,this.Latitude, this.Longtitude).subscribe(response => {
        loaderToShow.dismiss().then(()=>{
          if(response.success == true){
            if(this.mode == 1)
            {
              let toastr = this.toastrCtrl.create({
                message:"Successfully registration.",
                position: 'bottom',
                duration: 3000,
                cssClass: "toast-success",
              });
              toastr.present();
              this.stepper.nextStep();
            }
            else
            {
              this.navCtrl.setRoot(LoginPage);
            }
          }
          else
          {
            let toastr = this.toastrCtrl.create({
              message:"Registration not done!!",
              position: 'bottom',
              duration: 3000,
              cssClass: "toast-error",
            });
            toastr.present();
          }
        });
      });
    });
  }

  onReset() {
    // this.stepperForm.reset({
    //   name: '',
    //   email: '',
    //   address: '',
    // });
    // this._JSONString = '';
    this.stepper.setStep(0)
  }

  fngotologin(){
    this.navCtrl.setRoot(LoginPage);
  }

  fatchLocation() {
    var loaderToShow = this.loadingController.create({
      content: 'Please wait...'
    })
    this.geolocation.getCurrentPosition().then(pos => {
      loaderToShow.dismiss().then(() => {
        this.Latitude = pos.coords.latitude;
        this.Longtitude = pos.coords.longitude;

        let toastr = this.toastrCtrl.create({
          message:"Your current location successfully save.",
          position: 'bottom',
          duration: 2000,
          cssClass: "toast-success",
        });
        toastr.present();
      });
    });
  }

  fnCustomerDetail()
  {
    if (!this.validateEmail(this.email)) {
      let tostr = this.toastrCtrl.create({
        position: 'bottom',
        message: 'Please enter valid email address.',
        duration: 2000,
        cssClass: "toast-error",
      });
      tostr.present();
      return
    }
    else{
      this.stepper.nextStep();
    }
  }
}
