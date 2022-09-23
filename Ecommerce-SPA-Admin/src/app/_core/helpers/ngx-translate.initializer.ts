import { Injector } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { LOCATION_INITIALIZED } from '@angular/common';
import { LocalStorageConstant } from '@constants/local-storage.constant';
import { LangConstant } from '@constants/lang.constant';

export function ngxTranslateInitializer(translate: TranslateService, injector: Injector) {
  return () => new Promise<any>((resolve: any) => {
    const locationInitialized = injector.get(LOCATION_INITIALIZED, Promise.resolve(null));
    locationInitialized.then(() => {
      let langToSet = localStorage.getItem(LocalStorageConstant.LANG);
      if (!langToSet) {
        langToSet = LangConstant.EN;
        localStorage.setItem(LocalStorageConstant.LANG, LangConstant.EN);
      }
      translate.setDefaultLang(langToSet);
      translate.use(langToSet).subscribe({
        next: () => console.info(`Successfully initialized '${langToSet}' language.`),
        error: () => console.error(`Problem with '${langToSet}' language initialization.`),
        complete: () => resolve(null)
      });
    });
  });
}