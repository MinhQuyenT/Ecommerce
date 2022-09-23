import { Injectable } from "@angular/core";
import { ActivatedRouteSnapshot, Resolve, Router } from "@angular/router";
import { Size } from "@models/size";
import { PropertySizeService } from "@services/properties/property-size.service";
import { OperationResult } from "@utilities/operation-result";
import { EMPTY, Observable, of } from "rxjs";
import { catchError } from "rxjs/operators";

@Injectable({ providedIn: 'root' })
export class PropertySizeResolver implements Resolve<Size> {

    constructor(private router: Router, private sizeService: PropertySizeService) { }

    resolve(route: ActivatedRouteSnapshot): Observable<Size> {
        return this.sizeService.getSize(route.params['id']).pipe(
            catchError(() => {
                this.router.navigate(['/properties/size'])
                return EMPTY;
            })
        )
    }
}