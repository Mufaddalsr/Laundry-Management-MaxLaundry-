import { HttpClient,HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, Observer } from 'rxjs';
import {GlobalProvider} from  '../global/global'
/*
  Generated class for the ApiServiceProvider provider.

  See https://angular.io/guide/dependency-injection for more info on providers
  and Angular DI.
*/
@Injectable()
export class ApiServiceProvider {
  headers={
    headers: new HttpHeaders({
        'Content-Type': 'application/json'
    })
  }
  constructor(public http: HttpClient,public global : GlobalProvider) {
  }


  registerPhoneNumber(phoneNumber):Observable<any>{
    return this.http.get(this.global.apiUrl + '/api/Register/' + phoneNumber)
  }

  login(phoneNumber,password): Observable<any>{
    return this.http.post(this.global.apiUrl + '/api/Login', {
      PhoneNumber: phoneNumber,
      Password: password
    })
  }

  register(id,idString,fullName,email,phone,address,mode,companyId,corpID,mobileNumber,Latitude,Longtitude): Observable<any>{
    return this.http.post(this.global.apiUrl + '/api/register', {
      ID:id,
      IDString:idString,
      FullName : fullName,
      Email:email,
      PhoneNumber:phone,
      Address:address,
      Mode:mode,
      CompanyId:companyId,
      CorpID:corpID,
      MobileNumber:mobileNumber,
      CreatedBy:1,
      IsActive:1,
      Latitude:Latitude,
      Longitude:Longtitude
    });
  }

  getAllPromotion(): Observable<any>{
    return this.http.get(this.global.apiUrl + '/api/Promotions');
  }

  getCustomerProfile(): Observable<any>{
    return this.http.get(this.global.apiUrl + '/api/Customer/'+localStorage.getItem("idString"));
  }

  getCustomerDashboard(): Observable<any>{
    return this.http.get(this.global.apiUrl + '/api/Dashboard/'+localStorage.getItem("idString"));
  }
  updateCustomerProfile(fullName,email,phoneNumber,mobileNumber,address): Observable<any>{
    return this.http.put(this.global.apiUrl + '/api/UpdateCustomerProfile', {
      FullName:fullName,
      Email:email,
      ID:localStorage.getItem("id"),
      IDString:localStorage.getItem("idString"),
      PhoneNumber:phoneNumber,
      MobileNumber:mobileNumber,
      Address:address
    });
  }

  changepassword(oldpassword,newpassword): Observable<any>{
    return this.http.put(this.global.apiUrl + '/api/ChangePassword', {
      ID:localStorage.getItem("id"),
      IDString:localStorage.getItem("idString"),
      OldPassword:oldpassword,
      NewPassword:newpassword
    });
  }

  getBookingHistory():Observable<any>{
    return this.http.get(this.global.apiUrl + '/api/Booking/' + localStorage.getItem("idString"));
  }

  getInvoice():Observable<any>{
    return this.http.get(this.global.apiUrl + '/api/Invoice/' + localStorage.getItem("idString"))
  }

  getPriceList():Observable<any>{
    return this.http.get(this.global.apiUrl + '/api/PriceList/' + localStorage.getItem("idString"))
  }

  saveBooking(bookingDate,timeSlot,numberOfGarment):Observable<any>{
    return this.http.post(this.global.apiUrl + '/api/Booking',{
      CustomerId:localStorage.getItem("id"),
      IDString:localStorage.getItem("idString"),
      BookingDate:bookingDate,
      TimeSlot:timeSlot,
      NumberOfGarment:numberOfGarment,
      CreatedBy:1
    });
  }

  
}
