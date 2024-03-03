import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

/*
  Generated class for the GlobalProvider provider.
  See https://angular.io/guide/dependency-injection for more info on providers
  and Angular DI.
*/
@Injectable()
export class GlobalProvider {
   //apiUrl: string="http://localhost:56518";
  apiUrl: string="http://192.154.255.82:8372";
  
  constructor(public http: HttpClient) {
    // console.log('Hello GlobalProvider Provider');
  }
}
