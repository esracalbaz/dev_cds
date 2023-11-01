@AbapCatalog.sqlViewName: 'ZEC_003_V_EGITIM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'odev'
define view zec_003_ddl_odev as select from zec_002_ddl_egitim2
{
    key vbeln,
    sum(conversion_netwr) as Toplam_Net_Deger,
    kunnrAd,
    count(*) as toplamFatura,
    (cast(sum(conversion_netwr) as abap.fltp) / cast(count(*) as abap.fltp)) as Ortalama_miktar,
    substring(zec_002_ddl_egitim2.fkdat,1,4) as Faturalama_Yili,
    substring(zec_002_ddl_egitim2.fkdat,4,2) as Faturalama_Ayi,
    substring(zec_002_ddl_egitim2.fkdat,6,2) as Faturalama_Gunu,
    substring(zec_002_ddl_egitim2.inco2_l,1,3) as incoterm_yeri   
}
group by vbeln,
         kunnrAd,
         fkdat,
         inco2_l
