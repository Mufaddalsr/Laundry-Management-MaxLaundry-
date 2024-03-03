import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams, LoadingController, ToastController } from 'ionic-angular';
import { ApiServiceProvider } from '../../providers/api-service/api-service';

/**
 * Generated class for the PriceListPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-price-list',
  templateUrl: 'price-list.html',
})
export class PriceListPage {

  priceList = [];
  groupList = [];
  constructor(public navCtrl: NavController, public navParams: NavParams, public loadingCtrl: LoadingController,
    public toastCtrl: ToastController, public apiService: ApiServiceProvider) {
  }

  ionViewDidLoad() {
    this.getPriceListAll();
  }

  getPriceListAll() {
    var loaderToShow = this.loadingCtrl.create({
      content: 'Please wait...'
    })
    loaderToShow.present().then(() => {
      this.apiService.getPriceList().subscribe((response) => {

        loaderToShow.dismiss().then(() => {
          this.priceList = response.data;
          this.groupList = response.data1;
        });
      });
    });
  }

  // getItems(ev) {
  //   var val = ev.target.value;
  //   // Reset items back to all of the items
  //   if (val.trim() == '') {
  //     return this.priceList;
  //     alert(12);
  //   }
  //   // set val to the value of the ev target
  //   // if the value is an empty string don't filter the items
  //   if (val && val.trim() != '') {
  //     this.priceList = this.priceList.filter((item) => {
  //       return (item.garmetType.toLowerCase().indexOf(val.toLowerCase()) > -1);
  //     })
  //     alert(1);
  //   }

  // }
}
