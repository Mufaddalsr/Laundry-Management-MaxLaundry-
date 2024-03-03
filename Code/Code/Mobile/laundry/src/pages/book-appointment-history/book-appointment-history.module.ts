import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { BookAppointmentHistoryPage } from './book-appointment-history';

@NgModule({
  declarations: [
    BookAppointmentHistoryPage,
  ],
  imports: [
    IonicPageModule.forChild(BookAppointmentHistoryPage),
  ],
})
export class BookAppointmentHistoryPageModule {}
