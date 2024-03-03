import { Component,ViewChild } from '@angular/core';
import { IonicPage, NavController, NavParams,Nav,App} from 'ionic-angular';
import { HomePage } from '../home/home';
import {ProfilePage } from '../profile/profile';
import { AboutUsPage } from '../about-us/about-us';
import { ContactUsPage } from '../contact-us/contact-us';
import { PromoPage } from '../promo/promo';
import { LoginPage } from '../login/login';
import { BookAppointmentPage } from '../book-appointment/book-appointment';
import { BookAppointmentHistoryPage } from '../book-appointment-history/book-appointment-history';
import { PriceListPage } from '../price-list/price-list';


/**
 * Generated class for the MenuPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({  
  selector: 'page-menu',
  templateUrl: 'menu.html',
})
export class MenuPage {
  pages: Array<{title: string, component: any,icon:string}>;
  @ViewChild(Nav) nav: Nav;
  rootPage = HomePage;
  constructor(public navCtrl: NavController, public navParams: NavParams,public _app:App) {
    this.pages = [
      { title: 'Home', component: HomePage,icon : "ios-home-outline" },
      { title: 'Profile', component: ProfilePage,icon : "ios-person-outline" },
      { title: 'AboutUs', component: AboutUsPage,icon : "ios-contact-outline" },
      { title: 'ContactUs', component: ContactUsPage,icon : "ios-call-outline" },
      { title: 'Promotion', component: PromoPage,icon : "ios-contact-outline" },
      { title: 'Price List', component: PriceListPage,icon : "ios-card-outline" },
      { title: 'Book appointment', component: BookAppointmentPage,icon : "ios-time-outline" },
      { title: 'Book appointment history', component: BookAppointmentHistoryPage,icon : "ios-paper-outline" },
    ];
  }
  openPage(page) {
    this.nav.setRoot(page.component);
  }

  ionViewDidLoad() {
  }

  
  logout() {
    localStorage.removeItem("idString");
    this._app.getRootNav().setRoot(LoginPage);
  }
}
