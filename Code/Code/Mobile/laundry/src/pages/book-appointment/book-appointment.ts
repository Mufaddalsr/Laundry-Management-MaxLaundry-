import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,LoadingController,ToastController } from 'ionic-angular';
import { ApiServiceProvider} from '../../providers/api-service/api-service';
import {BookAppointmentHistoryPage} from '../book-appointment-history/book-appointment-history';
import { from } from 'rxjs/observable/from';

/**
 * Generated class for the BookAppointmentPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-book-appointment',
  templateUrl: 'book-appointment.html',
})
export class BookAppointmentPage {

  customerId:number=27;
  bookingDate:string;
  timeSlot:number;
  numberOfGarments:number;

  constructor(public navCtrl: NavController, public navParams: NavParams,public loadingCtrl:LoadingController,
              public toastCtrl:ToastController,public apiService : ApiServiceProvider) {
  }

  ionViewDidLoad() {
  }

  saveBooking()
  {
    var loaderToShow = this.loadingCtrl.create({
      content:"Please wait.."
    });
    loaderToShow.present().then(()=>{
      this.apiService.saveBooking(this.bookingDate,this.timeSlot,this.numberOfGarments).subscribe(response =>{
        loaderToShow.dismiss().then(()=>{
          if(response.success == "alreadyBook")
          {
            let toast = this.toastCtrl.create({
              position:"bottom",
              duration:2000,
              cssClass:"toast-error",
              message :response.message
            });
            toast.present();
          }
          else if(response.success == true)
          {
            let toast = this.toastCtrl.create({
              position:"bottom",
              duration:2000,
              cssClass:"toast-success",
              message :"Book your appointment successfully!"
            });
            toast.present();
            this.navCtrl.setRoot(BookAppointmentHistoryPage);
          }
          else{
            let toast = this.toastCtrl.create({
              position:"bottom",
              duration:2000,
              cssClass:"toast-error",
              message :"Booking not done!"
            });
            toast.present();
          }
        });
      });
    });
  }
}
