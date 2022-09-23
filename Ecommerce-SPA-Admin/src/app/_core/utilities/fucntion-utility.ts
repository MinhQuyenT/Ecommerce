import { ElementRef, Injectable } from '@angular/core';
import { HttpParams } from "@angular/common/http";
import { Pagination } from './pagination-utility';

@Injectable({ providedIn: 'root', })
export class FunctionUtility {
  constructor() { }


  /**
   * Convert today to string format
   * @returns yyyy/MM/dd
   */
  getToDay() {
    const date = new Date();
    return `${date.getFullYear()}/${date.getMonth() + 1}/${date.getDate()}`;
  }

  /**
   * Convert input date to string format
   * @param date
   * @returns yyyy/MM/dd
   */
  getDateFormat(date: Date) {
    return `${date.getFullYear()}/${date.getMonth() + 1}/${date.getDate()}`;
  }

  /**
   * Convert input date to short date string format
   * @param date
   * @returns yyyyMM
   */
  getFullYearAndMonthToString(date: Date) {
    return `${date.getFullYear()}${date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : (date.getMonth() + 1)}`;
  }

  /**
   * Convert to short month string format
   * @param month
   * @returns MMM.
   */
  getMonthInCharacter(month: string) {
    const months = ['Jan.', 'Feb.', 'Mar.', 'Apr.', 'May', 'Jun.', 'Jul.', 'Aug.', 'Sep.', 'Oct.', 'Nov.', 'Dec.'];
    return months[Number(month) - 1];
  }

  /**
   * Check if folder name contains special characters
   * @param folderName
   * @returns true | false
   */
  checkCreatFolder(folderName: string) {
    const charCheck = /[\\/,:*?"|<>]+/;
    if (charCheck.test(folderName)) {
      return true;
    }
    return false;
  }

  /**
   * Return the first date of current month
   * @returns Date
   */
  getFirstDateOfCurrentMonth() {
    const today = new Date();
    return new Date(today.getFullYear() + '/' + (today.getMonth() + 1) + '/' + '01');
  }

  /**
   * Convert input date to date without time
   * @param date
   * @returns Date
   */
  returnDayNotTime(date: Date) {
    return new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate(), 0, 0, 0));
  }

  returnDayNotTime2(date: string) {
    var a = new Date(date.substr(0, 4) + '/' + date.substr(5, 2) + '/' + date.substr(8, 2));

    return new Date(Date.UTC(a.getFullYear(), a.getMonth(), a.getDate(), 0, 0, 0));
  }

  /**
   * Get new UTC Date
   * @returns new UTC Date
   */
  getNewUTCDate() {
    let d = new Date();
    return new Date(Date.UTC(d.getFullYear(), d.getMonth(), d.getDate(), d.getHours(), d.getMinutes(), d.getSeconds(), d.getMilliseconds()));
  }

  getUTCDate(d?: Date) {
    let date = d ? d : new Date();
    return new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds()));
  }

  dateIFFinMonths(d1: Date, d2: Date) {
    var d1Y = d1.getFullYear();
    var d2Y = d2.getFullYear();
    var d1M = d1.getMonth();
    var d2M = d2.getMonth();

    return (d1M + 12 * d1Y) - (d2M + 12 * d2Y);
  }

  /**
   * Append Script tag
   * * @param src
   * * @param elementRef
   */
  appendScript(src: string, elementRef: ElementRef) {
    let script = document.createElement("script");
    script.async = true;
    script.type = "text/javascript";
    script.src = src;
    elementRef.nativeElement.appendChild(script);
  }

  /**
   * Append multiple Script tag
   * * @param srcs
   * * @param elementRef
   */
  appendMultipleScript(srcs: string[], elementRef: ElementRef) {
    srcs.forEach(src => {
      let script = document.createElement("script");
      script.async = true;
      script.type = "text/javascript";
      script.src = src;
      elementRef.nativeElement.appendChild(script);
    });
  }

  /**
   * Append property FormData
   * If property type Date => Convert value to String
   * * @param formValue
   */
  toFormData(formValue: any) {
    const formData = new FormData();
    for (const key of Object.keys(formValue)) {
      const value = formValue[key];
      formData.append(key, value);
    }
    return formData;
  }

  /**
   * Append property HttpParams
   * * @param formValue
   */
  toParams(formValue: any) {
    let params = new HttpParams();
    for (const key of Object.keys(formValue)) {
      const value = formValue[key];
      params = params.append(key, value);
    }
    return params;
  }

  calculatePagination(pagination: Pagination) {
    if (pagination.pageNumber === pagination.totalPage && pagination.pageNumber !== 1) {
      const currentItemQty = pagination.totalCount - (pagination.pageNumber - 1) * pagination.pageSize;
      if (currentItemQty === 1) {
        pagination.pageNumber--;
      }
    }
  }
}
