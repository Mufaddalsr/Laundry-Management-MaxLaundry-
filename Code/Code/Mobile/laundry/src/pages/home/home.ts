import { Component } from '@angular/core';
import { NavController,LoadingController,ToastController  } from 'ionic-angular';
import { ApiServiceProvider } from '../../providers/api-service/api-service';
import { PromoPage}from  '../promo/promo';
import { PriceListPage}from  '../price-list/price-list';
import { BookAppointmentPage}from  '../book-appointment/book-appointment';
import { BookAppointmentHistoryPage}from  '../book-appointment-history/book-appointment-history';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  totalPromotions:string="";
  totalPriceList:string="";

  customerName:string="";
  constructor(public navCtrl: NavController,public loadingController: LoadingController,
    public apiService: ApiServiceProvider,public toastCtrl:ToastController) {

  }

  ionViewDidLoad()
  {
    var loaderToShow = this.loadingController.create({
      content: 'Please wait...'
    })
    loaderToShow.present().then(() => {
      this.apiService.getCustomerDashboard().subscribe(response=>{
        loaderToShow.dismiss().then(() => {
          this.totalPromotions = response.totalPromotions;
          this.totalPriceList = response.totalPriceList;
          this.customerName = localStorage.getItem('customerName');
        });
      });
    });
  }

  gotoPromotion()
  {
    this.navCtrl.push(PromoPage);
  }

  gotoPriceList()
  {
    this.navCtrl.push(PriceListPage);
  }

  gotoBookingAppointment()
  {
    this.navCtrl.push(BookAppointmentPage);
  }

  gotoBookingHistory()
  {
    this.navCtrl.push(BookAppointmentHistoryPage);
  }
}
