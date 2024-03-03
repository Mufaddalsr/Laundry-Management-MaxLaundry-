import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,LoadingController,ToastController } from 'ionic-angular';
import { ApiServiceProvider} from '../../providers/api-service/api-service';

/**
 * Generated class for the PromoPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-promo',
  templateUrl: 'promo.html',
})
export class PromoPage {

  constructor(public apiService: ApiServiceProvider,public navCtrl: NavController, public navParams: NavParams,public loadingController: LoadingController) {
  }
  promotions=[];
  ionViewDidLoad() {
    var loaderToShow = this.loadingController.create({
      content: 'Please wait...'
    })
    loaderToShow.present().then(() => {
      this.apiService.getAllPromotion().subscribe((response)=>{
        loaderToShow.dismiss().then(() => {
          this.promotions = response;
        });
      },);
    });
  }
}
