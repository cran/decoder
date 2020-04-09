# Geography ---------------------------------------------------------------

#' Swedish health care regional codes
#'
#' Key-value codes for the Swedish health care regions (1-6).
#'
#' @docType data
#' @keywords datasets
#' @name region
#' @family key_value_data
NULL


#' Swedish county codes
#'
#' Key-value codes for the Swedish counties (lan).
#' Two first digits of the LKF code.
#' Be aware of the spelling ("lan")!
#'
#' @docType data
#' @keywords datasets
#' @name lan
#' @family key_value_data
NULL


#' Swedish district codes
#'
#' Key-value codes for the Swedish districts (introduced 2016-01-01).
#'
#' @docType data
#' @keywords datasets
#' @name distrikt
#' @family key_value_data
#' @source \url{https://www.scb.se/hitta-statistik/regional-statistik-och-kartor/regionala-indelningar/distrikt/}
NULL


#' Geographical health care areas
#'
#' Key-value codes for health care areas.
#'
#' \itemize{
#'   \item{Key: the first four digits from the LKF-code}
#'   \item{Value: A geographical area (sub area of county/lan) with special 
#'     interest}
#' }
#'
#' The object currently only applies to the Western health care region
#' \itemize{
#'   \item{Storgoteborg}
#'   \item{Fyrbodal}
#'   \item{Sodra_Alvsborg}
#'   \item{Skaraborg}
#'   \item{Norra_Halland}
#' }
#' Updates for other regions needs to be requested (please do!).
#'
#' @section Kungalv:
#'  Kungalv is an independent area by default. There are situations when Kungalv 
#'  should be dealt with as an
#'  independent health care region or as a part of greater Gothenburg. 
#'  See section "extra_functions" in \link{decode}
#'  to handle this.
#'
#' @docType data
#' @keywords datasets
#' @name sjukvardsomrade
#' @seealso  \link{extra_functions}
#' @family key_value_data
NULL


#' HSN code (Hälso- och sjukvårdsnamnd)
#'
#' Key-value codes for the HSN:s in VGR valid from 2015.
#' Based on municipality codes (\code{\link{kommun}}).
#' Data from 2014-12-17.
#'
#' Categorization:
#' \describe{
#' \item{Norra}{Lysekil, Munkedal, Orust, Sotenäs, Strömstad, Tanum, Bengtsfors, 
#' Dals-Ed, Färgelanda, Mellerud, Åmål, Trollhättan, Uddevalla och Vänersborg}
#' \item{Västra}{Lilla Edet, Ale, Kungälv, Stenungsund, Tjörn, Öckerö, Härryda, 
#' Mölndal, Partille, Lerum och Alingsås}
#' \item{Södra}{Herrljunga, Vårgårda, Bollebygd, Borås, Mark, Svenljunga, 
#' Tranemo och Ulricehamn}
#' \item{Göteborg}{Göteborg}
#' \item{Östra}{Essunga, Falköping, Grästorp, Götene, Lidköping, Skara, Vara, 
#' Gullspång, Hjo, Karlsborg, Mariestad, Skövde, Tibro, Tidaholm och Töreboda}
#' }
#' @docType data
#' @keywords datasets
#' @name hsn
#' @family key_value_data
NULL


#' Swedish municipality codes
#'
#' Key-value codes for the Swedish municipalities.
#' First four digits in the LKF code.
#' Data from 2014-08-12.
#'
#' @docType data
#' @keywords datasets
#' @name kommun
#' @family key_value_data
#' @source \url{https://www.scb.se/hitta-statistik/regional-statistik-och-kartor/regionala-indelningar/lan-och-kommuner/}
NULL


#' Swedish parish codes
#'
#' Key-value codes for the Swedish parishes (forsamlingar).
#' All six digits in the LKF code.
#' 
#' @docType data
#' @keywords datasets
#' @name forsamling
#' @family key_value_data
#' @source \url{https://www.scb.se/hitta-statistik/regional-statistik-och-kartor/regionala-indelningar/lan-och-kommuner/}
NULL


#' hemort and hemort2 codes (geographical codes)
#'
#' Both \code{hemort} and \code{hemort2} combines regional codes for lan, 
#' kommun and forsamling.
#' \code{hemort} is the official (but rather old) code used within RCC. 
#' \code{hemort2} is an updated version combining \code{\link{lan}}, 
#' \code{\link{kommun}} and \code{\link{forsamling}}
#' 
#' @docType data
#' @keywords datasets
#' @name hemort
#' @family key_value_data
NULL

#' @rdname hemort
#' @name hemort2
NULL



# Administration ----------------------------------------------------------


#' Hospital codes
#'
#' Key-value codes for Swedish hospitals and some primary health care units.
#'
#' Data from 'Rockan'. Note that this is an old version of the classification!
#' See the reference link below for the new version.
#' The old version should be used of historical reasons.
#' One difference is for example that the Sahlgrenska university hospital is 
#' one hospital
#' in the new version of the classification but the Swedish regional cancer 
#' centers
#' still classify it as three different hospitals.
#' Note also that primary health care units did receive their own codes until 
#' 1992 (?)
#' but not later!
#'
#' @docType data
#' @keywords datasets
#' @name sjukhus
#' @family key_value_data

NULL


#' Hospital codes used by Socialstyrelsen and the National Patient Register
#'
#' Codes taken from Excel sheets 2014 from link below.
#'
#' @docType data
#' @keywords datasets
#' @name sjukhus_par
#' @family key_value_data

NULL


#' Hospital codes used by INCA
#'
#' Codes taken from INCA's organizational register 2017-02-03.
#'
#' @docType data
#' @keywords datasets
#' @name sjukhus_inca
#' @family key_value_data
NULL


#' Clinic codes
#'
#' Key-value codes for the Swedish clinic types.
#' Data mainly from url below (taken from the PDF).
#' Some extra codes are added from Rockan (290, 291, 292, 446, 921 and 999 for unknown).
#'
#' @docType data
#' @keywords datasets
#' @name klinik
#' @family key_value_data
NULL


#' Pathology department codes
#'
#' Key-value codes for the Swedish "laboratories".
#' Data is combined from two sources.
#' \enumerate{
#'  \item The official list from SOFS 2006:15 (see url below). 
#'  This is the primary source for codes
#'  appearing in both sources.
#'  \item Extra codes are also added from the old Rockan registry for historical 
#'  reasons.
#' }
#' @docType data
#' @keywords datasets
#' @name patologiavdelning
#' @family key_value_data
NULL



# Diagnostics -------------------------------------------------------------

#' Klassifikation av vardatgarder (KVA)
#'
#' Key-value codes for KVA (for surgery and medicine.
#'
#' @docType data
#' @keywords datasets
#' @name kva
#' @family key_value_data
#' @source \url{https://www.socialstyrelsen.se/utveckla-verksamhet/e-halsa/klassificering-och-koder/kva/}
NULL


#' M-stadium
#'
#' Key-value codes for M-stadium (sep-03).
#' Data from Rockan (Rocen).
#'
#' @docType data
#' @keywords datasets
#' @name m_rtr
#' @family key_value_data
NULL


#' N-stadium
#'
#' Key-value codes for N-stadium (sep-03).
#' Data from Rockan (Rocen).
#'
#' @docType data
#' @keywords datasets
#' @name n_rtr
#' @family key_value_data
NULL


#' T-stadium
#'
#' Key-value codes for T-stadium (sep 2003).
#' Data from Rockan (Rocen).
#'
#' @docType data
#' @keywords datasets
#' @name t_rtr
#' @family key_value_data
NULL


#' FIGO-stadium
#'
#' Key-value codes for FIGO-stadium (Tumorutbredning enl FIGO, sep 2003).
#' Data from Rockan (Rocen).
#'
#' @docType data
#' @keywords datasets
#' @name figo
#' @family key_value_data
NULL


#' ICD-7 Grov
#'
#' Key-value codes for just the first three digits of the ICDO-7 code.
#' This gives broader grouping.
#'
#' @docType data
#' @keywords datasets
#' @name icd7_grov
#' @family key_value_data
NULL


#' ICD-7
#'
#' Key-value codes for ICD-7.
#' Data from Rockan (Rocen).
#'
#' @docType data
#' @keywords datasets
#' @name icd7
#' @family key_value_data
NULL


#' ICD-9
#'
#' Key-value codes for ICD-9.
#' Data from Rockan (Rocen).
#'
#' @docType data
#' @keywords datasets
#' @name icd9
#' @family key_value_data
NULL


#' ICD-O
#'
#' Key-value codes for ICD-O.
#' Data from Rockan (Rocen).
#'
#' @docType data
#' @keywords datasets
#' @name icdo
#' @family key_value_data
NULL


#' ICD-O3
#'
#' Key-value codes for ICD-O3.
#' Data from Rockan (Rocen).
#'
#' @docType data
#' @keywords datasets
#' @name icdo3
#' @family key_value_data
NULL


#' ICD-O3 Grov
#'
#' Key-value codes for just the first two digits of the ICDO-3 code.
#' This gives broader grouping.
#' Based on the table of contents from:
#' http://www.socialstyrelsen.se/Lists/Artikelkatalog/Attachments/19446/2014-5-12.pdf
#'
#' @docType data
#' @keywords datasets
#' @name icdo3_grov
#' @family key_value_data
NULL


#' Sida
#'
#' Key-value codes for sida (Sida, 1 = Hoger, 2 = Vanster, 9 = Okant).
#' Data from Rockan (Rocen).
#'
#' @docType data
#' @keywords datasets
#' @name sida
#' @family key_value_data
NULL


#' Grund till TNM (patologisk/klinisk)
#'
#' Key-value codes for TNM-grund (Grund till TNM, 1=patologisk, 2=klinisk).
#' Data from Rockan (Rocen).
#'
#' @docType data
#' @keywords datasets
#' @name tnmgrund
#' @family key_value_data
NULL


#' ICD-10 code
#'
#' Key-value codes for ICD-10-SE 2020 (Swedish version).
#' Note that key codes are given without dots, i e C569, not C56.9.
#'
#' @docType data
#' @keywords datasets
#' @name icd10
#' @family key_value_data
#' @source \url{https://www.socialstyrelsen.se/utveckla-verksamhet/e-halsa/klassificering-och-koder/kodtextfiler/}
NULL


#' ICD-9-CM diagnosis and procedure codes
#'
#' Key-value codes for ICD-9-CM diagnostics (\code{icd9cmd}) and 
#' procedure (\code{icd9cmp}) codes (version 32).
#'
#' @docType data
#' @keywords datasets
#' @name icd9cmd
#' @family key_value_data
#' @source \url{https://www.cms.gov/Medicare/Coding/ICD9ProviderDiagnosticCodes/codes}
NULL

#' @rdname icd9cmd
#' @name icd9cmp
NULL


#' Snomed code
#'
#' Key-value codes for Snomed. Data from Rockan 2012-10-05.
#' Note tht this variable is the same as \code{snomed} from Rockan.
#' It should not be confused with the later version \code{snomed3}!
#'
#' @docType data
#' @keywords datasets
#' @name snomed
#' @family key_value_data
NULL


#' Snomed 3
#'
#' Key-value codes for Snomed3 (fr 2005).
#' Data from Rockan (Rocen).
#'
#' @docType data
#' @keywords datasets
#' @name snomed3
#' @family key_value_data
NULL


#' PAD (C24) code
#'
#' Key-value codes for PAD (C24) Data from Rockan 2012-09-18.
#'
#' @docType data
#' @keywords datasets
#' @name pad
#' @family key_value_data
NULL


# Misc --------------------------------------------------------------------

#' Gender code (kon)
#'
#' Key-value codes for gender (1 = man (Male) and 2 = Kvinna (female)).
#' Be aware of the spelling ("kon")!
#'
#' @docType data
#' @keywords datasets
#' @name kon
#' @family key_value_data
NULL

#' Anatomical Therapeutic Chemical (ATC) Classification System codes
#'
#' Key-value codes for ATC from the Swedish Medical Products Agency (2020-04-07).
#'
#' @docType data
#' @keywords datasets
#' @name atc
#' @family key_value_data
#' @source \url{https://nsl.mpa.se/}
NULL

#' Help tables from Rockan
#'
#' Key-value codes from old help tables used with Rockan 
#' (by Swedish regional cancer centers) 
#' @docType data
#' @keywords datasets
#' @name rockan
#' @family key_value_data
#' @aliases avgm ben digr dodca manuell obd status manuell
NULL
