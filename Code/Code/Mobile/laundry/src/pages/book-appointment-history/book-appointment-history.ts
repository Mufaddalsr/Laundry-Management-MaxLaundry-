import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,LoadingController,ToastController } from 'ionic-angular';
import { ApiServiceProvider} from '../../providers/api-service/api-service';

/**
 * Generated class for the BookAppointmentHistoryPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-book-appointment-history',
  templateUrl: 'book-appointment-history.html',
})
export class BookAppointmentHistoryPage {

  bookingHistoryList=[];
  orderList=[];

  segmentSelected:string = "bookingHistory";
  constructor(public navCtrl: NavController, public navParams: NavParams,public loadingCtrl:LoadingController,
            public toastCtrl:ToastController,public apiService : ApiServiceProvider) {
  }

  ionViewDidLoad() {
    this.getBookingHistory();
    this.getOrders();
  }

  getBookingHistory()
  {
    var loaderToShow = this.loadingCtrl.create({
      content: 'Please wait...'
    })
    loaderToShow.present().then(() => {
      this.apiService.getBookingHistory().subscribe((response)=>{
        loaderToShow.dismiss().then(() => {
          this.bookingHistoryList = response;
        });
      },);
    });
  }

  getOrders()
  {
    var loaderToShow = this.loadingCtrl.create({
      content: 'Please wait...'
    })
    loaderToShow.present().then(() => {
      this.apiService.getInvoice().subscribe((response)=>{
        loaderToShow.dismiss().then(() => {
          this.orderList = response;
        });
      },);
    });
  }

  segmentChanged(e){
 }
}
