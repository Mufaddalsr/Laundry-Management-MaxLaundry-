import { BrowserModule } from '@angular/platform-browser';
import { ErrorHandler, NgModule } from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';
import { SplashScreen } from '@ionic-native/splash-screen';
import { StatusBar } from '@ionic-native/status-bar';

import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';
import { LoginPage } from '../pages/login/login';
import { RegisterPage } from '../pages/register/register';
import { MenuPage } from '../pages/menu/menu';
import { ProfilePage } from '../pages/profile/profile';
import { AboutUsPage } from '../pages/about-us/about-us';
import { ContactUsPage } from '../pages/contact-us/contact-us';
import { PromoPage } from '../pages/promo/promo';

import { BookAppointmentPage } from '../pages/book-appointment/book-appointment';
import { PriceListPage } from '../pages/price-list/price-list';
import { BookAppointmentHistoryPage} from '../pages/book-appointment-history/book-appointment-history';

import { ApiServiceProvider } from '../providers/api-service/api-service';
import { GlobalProvider } from '../providers/global/global';
import { HttpClientModule } from '@angular/common/http';
import { Geolocation } from '@ionic-native/geolocation';

import { IonicStepperModule } from 'ionic-stepper';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

@NgModule({
  declarations: [
    MyApp,
    HomePage,
    LoginPage,
    RegisterPage,
    MenuPage,
    ProfilePage,
    AboutUsPage,
    ContactUsPage,
    PromoPage,
    BookAppointmentPage,
    BookAppointmentHistoryPage,
    PriceListPage
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    BrowserAnimationsModule,
    IonicStepperModule,
    IonicModule.forRoot(MyApp)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    HomePage,
    LoginPage,
    RegisterPage,
    MenuPage,
    ProfilePage,
    AboutUsPage,
    ContactUsPage,
    PromoPage,
    BookAppointmentPage,
    BookAppointmentHistoryPage,
    PriceListPage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler},
    ApiServiceProvider,
    GlobalProvider,
    Geolocation
  ]
})
export class AppModule {}
