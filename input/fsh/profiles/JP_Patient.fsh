// ==============================
//   Profile 定義
// ==============================
Profile: JP_Patient
Parent: Patient
Id: jp-patient
Title: "JP Core Patient Profile"
Description: "このプロファイルはPatientリソースに対して、患者のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Patient"
* ^status = #active
* ^date = "2022-09-26"
* . ^short = "Information about an individual or animal receiving health care services　医療サービスを受けている個人または動物に関する情報"
* . ^definition = "Demographics and other administrative information about an individual or animal receiving care or other health-related services.\r\n\r\nケアまたはその他の健康関連サービスを受けている個人または動物に関する人口統計およびその他の管理情報。"
* extension contains
    $patient-religion named religion ..* and
    $patient-birthPlace named birthPlace ..1 and
    JP_Patient_Race named race ..*
* extension[religion] ^short = "患者の宗教 【詳細参照】"
* extension[religion] ^definition = "The patient's professed religious affiliations.\r\n患者の公言された宗教的所属。"
* extension[religion] ^comment = "患者の宗教をValueSet(v3.ReligiousAffiliation)より選択する。輸血や食事で考慮が必要な場合がある。 
- 1013 キリスト教
- 1020 ヒンドゥー教
- 1023 イスラム教

など"
* extension[birthPlace] ^short = "患者の生誕地 【詳細参照】"
* extension[birthPlace] ^definition = "The registered place of birth of the patient. A system may use the address.text if they don't store the birthPlace address in discrete elements.\r\n患者の登録された出生地。システムは、birthPlaceアドレスを個別の要素に格納しない場合、address.textを使用してよい。"
* extension[birthPlace] ^comment = "患者の生誕地をAddress型で表現する"
* extension[race] ^short = "患者の人種 【詳細参照】"
* extension[race] ^definition = "Optional Extension Element - found in all resources.\r\nオプションの拡張要素-すべてのリソースで使用できる。"
* extension[race] ^comment = "患者の人種をValueSet(Race)より選択する。  
- 2034-7 中国人
- 2039-6 日本人
- 2040-4 韓国人
- 2108-9 ヨーロッパ人
- 2110-5 英国人
- 2111-3 フランス人
- 2112-1 ドイツ人

など"
* identifier 1..
* identifier ^short = "An identifier for this patient 【詳細参照】" 
* identifier ^definition = "An identifier for this patient.\r\n\r\nこの患者の識別子。"
* identifier ^comment = "IDの名前空間を表す Patient.identifier.system と ID値そのものを表す Patient.identifier.value の組み合わせとして表現する。  
Patient.identifier.system には、urn:oid:1.2.392.100495.20.3.51.医療機関識別OID番号を使用する。  
医療機関識別OID番号は患者IDの発行者である医療機関の識別するものである。保険医療機関の場合、都道府県番号２桁から始まる10桁の医療機関コードまたは、特定健診・特定保健指導機関の医療機関コード10桁の先頭に１をつけた11桁とする。医療機関コードの詳細については[こちらのリンク](StructureDefinition-jp-organization.html#医療機関コード)を参照すること。  
例：医療機関コード「1312345670」の場合「urn:oid:1.2.392.100495.20.3.51.11312345670」  

なお、urn:oid:1.2.392.100495.20.3.51の部分は、「[処方情報 HL7FHIR 記述仕様](https://std.jpfhir.jp/stddoc/ePrescriptionDataFHIR_v1x.pdf)」表19 識別子名前空間一覧において医療機関等の患者IDとして割り当てられたOIDのURL型である。地域医療連携ネットワークの地域患者IDを指定する場合も同様に、地域患者IDを識別する名前空間（IHE ITI PIX等で使用されるOID等）をsystemに使用することができる。"
* identifier ^requirements = "Patients are almost always assigned specific numerical identifiers.\r\n\r\nほとんどの場合、患者には特定の数値識別子が割り当てられる。"
* identifier.use ^short = "usual | official | temp | secondary | old (If known) 【詳細参照】"
* identifier.use ^comment = "Applications can assume that an identifier is permanent unless it explicitly says that it is temporary.  
IDの種別をValueSet(IdentifierUse)より選択する。  
- usual : 一般
- official : 公式（マイナンバーなど、最も信頼できると見なされる場合に使用）
- temp : 一時的
- secondary : 二次利用
- old : 過去の識別子"
* identifier.type ^short = "Description of identifier 【詳細参照】"
* identifier.type ^comment = "This element deals only with general categories of identifiers.  It SHOULD not be used for codes that correspond 1..1 with the Identifier.system. Some identifiers may fall into multiple categories due to common usage.   Where the system is known, a type is unnecessary because the type is always part of the system definition. However systems often need to handle identifiers where the system is not known. There is not a 1:1 relationship between type and system, since many different systems have the same type.  
IDの種別をValueSet(Identifier Type Codes)より選択する。
- DL : 運転免許証番号
- PPN : パスポート番号
- BRN : 血統登録番号
- MR : カルテ番号

など"
* identifier.system ^short = "The namespace for the identifier value 【詳細参照】"
* identifier.system ^comment = "Identifier.system is always case sensitive.  
IDの名前空間を表す。\r\n医療機関固有の患者ID（カルテNo）を表現する場合、system には、患者IDの発行者である医療機関を識別するuriを指定する。  
医療機関を識別するために使用するOID について、もし適切なOID が存在しない場合で、その医療施設が保険医療機関の場合、特定健診・特定保健指導機関のルールに従い以下のルールで設定してもよい。  
医療施設が固有のOID を持っている場合は、そのOID を指定する。医療施設が保険医療機関の場合、特定健診・特定保健指導機関の医療機関コードの OID「1.2.392.200119.6.102.」の末尾に「[1]＋医療機関コード（10 桁）」を指定する。医療機関コードを持たない場合、「[9]＋当該施設の電話番号下 9 桁」を医療機関コードとする。  
例：医療機関コード「1312345670」の場合「1.2.392.200119.6.102.11312345670」  
Patient.identifier.system は、uri 型のため、実際にインスタンスに設定される値は、上記の例であれば urn:oid:1.2.392.200119.6.102.11312345670 とする。"
* identifier.value 1..
* identifier.value ^short = "The value that is unique 【詳細参照】"
* identifier.value ^comment = "If the value is a full URI, then the system SHALL be urn:ietf:rfc:3986.  The value's primary purpose is computational mapping.  As a result, it may be normalized for comparison purposes (e.g. removing non-significant whitespace, dashes, etc.)  A value formatted for human display can be conveyed using the [Rendered Value extension](extension-rendered-value.html). Identifier.value is to be treated as case sensitive unless knowledge of the Identifier.system allows the processor to be confident that non-case-sensitive processing is safe.\r\n\r\n患者を一意的に識別するID(例えば、患者IDやカルテ番号など)を設定。"
* identifier.period ^comment = "A Period specifies a range of time; the context of use will specify whether the entire range applies (e.g. \"the patient was an inpatient of the hospital for this time range\") or one value from the range applies (e.g. \"give to the patient between these two times\").  
Period is not used for a duration (a measure of elapsed time). See [Duration](http://hl7.org/fhir/R4/datatypes.html#Duration).\r\n\r\nIDが使われていた/使われている期間。"
* identifier.assigner only Reference(JP_Organization)
* identifier.assigner ^comment = "The Identifier.assigner may omit the .reference element and only contain a .display element reflecting the name or other textual information about the assigning organization.\r\n\r\nIDを発行した組織（テキストのみでも可）"
* active ^definition = "Whether this patient record is in active use. \nMany systems use this property to mark as non-current patients, such as those that have not been seen for a period of time based on an organization's business rules.\n\nIt is often used to filter patient lists to exclude inactive patients\n\nDeceased patients may also be marked as inactive for the same reasons, but may be active for some time after death.  
この患者記録がアクティブに使用されているかどうか。多くのシステムは、このプロパティを使用して、組織のビジネスルールに基づいて一定期間見られなかった患者など、非現在の患者としてマークする。  
非アクティブな患者を除外するために患者リストをフィルタリングするためによく使用される。  
死亡した患者は、同じ理由で不活性とマークされる場合があるが、死後しばらくは活性である場合がある。"
* active ^comment = "If a record is inactive, and linked to an active record, then future patient/record updates should occur on the other patient.  
この患者の記録が有効かどうか  
誤って患者を登録して削除したい場合などにfalseにする"
* active ^requirements = "Need to be able to mark a patient record as not to be used because it was created in error.  
患者レコードが誤って作成された場合のため、使用されないレコードとしてマークできる必要がある。"
* active ^meaningWhenMissing = "This resource is generally assumed to be active if no value is provided for the active element  
アクティブな要素に値が指定されていない場合、このリソースは通常アクティブであると想定される"
* active ^isModifierReason = "This element is labelled as a modifier because it is a status element that can indicate that a record should not be treated as valid この要素は、レコードの有効・無効判定を示すステータス要素であるため、修飾子としてラベル付けされる"
* name only JP_HumanName
* name ^definition = "A name associated with the individual.\r\n\r\n個人に関連付けられた名前。"
* name ^comment = "Names may be changed, or repudiated, or people may have different names in different contexts. Names may be divided into parts of different type that have variable significance depending on context, though the division into parts does not always matter. With personal names, the different parts might or might not be imbued with some implicit meaning; various cultures associate different importance with the name parts and the degree to which systems must care about name parts around the world varies widely.  
患者は、用途や適用期間が異なる複数の名前を持つ場合がある。動物の場合、名前は人間によって割り当てられて使用され、同じパターンを持つという意味で「HumanName」を使用する。  
FHIRデータ型仕様に従って、以下の内容を採用する。
- 姓名分割できる場合は、名前パート HumanName.familyとHumanName.givenに指定する
- ミドルネームがある場合は、given に指定する（givenは繰り返し可能）  
- 姓名に分割できない場合は、HumanName.text にフルネームを指定する
- 各名前パートとtext は、両方存在してもよい
- 漢字氏名、カナ氏名の区別は、iso21090-EN-representation を使用する"
* name ^requirements = "Need to be able to track the patient by multiple names. Examples are your official name and a partner name.\r\n\r\n複数の名前で患者を追跡できる必要がある。例としては、正式名とパートナー名がある。"
* telecom ^short = "A contact detail for the individual　個人に連絡するための連絡先の詳細"
* telecom ^definition = "A contact detail (e.g. a telephone number or an email address) by which the individual may be contacted.\r\n\r\n個人に連絡するための連絡先の詳細（電話番号や電子メールアドレスなど）。"
* telecom ^comment = "A Patient may have multiple ways to be contacted with different uses or applicable periods.  May need to have options for contacting the person urgently and also to help with identification. The address might not go directly to the individual, but may reach another party that is able to proxy for the patient (i.e. home phone, or pet owner's phone).\r\n\r\n患者は、さまざまな用途または適用期間違いで連絡先を複数の方法を持っている場合がある。緊急時連絡先として、また身元確認を支援するためのオプションが必要になる場合がある。患者当人に直接連絡できない場合があるが、患者を代理できる別の関係者（自宅の電話、またはペットの所有者の電話）を設定する場合もある。"
* telecom ^requirements = "People have (primary) ways to contact them in some way such as phone, email.\r\n\r\n人々は、電話、電子メールなどの何らかの方法で彼らに連絡する（プライマリ）方法を持っている。"
* telecom.system ^short = "phone | fax | email | pager | url | sms | other 【詳細参照】"
* telecom.system ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size  
患者の連絡先の種別をValueSet(ContactPointSystem)より選択する。  
- phone : 電話
- fax : Fax 
- email : 電子メール
- pager : ポケットベル
- url : 電話、ファックス、ポケットベル、または電子メールアドレスではなく、URLとして表される連絡先  
これはWebサイト、ブログ、Skype、Twitter、Facebookなどのさまざまな機関または個人の連絡先を対象としている。電子メールアドレスには使用しないこと。
- sms : SMSメッセージの送信に使用できる連絡先（携帯電話、一部の固定電話など）  
- other : 電話、Fax、ポケットベル、または電子メールアドレスではなく、URLとして表現できない連絡先  
例：内部メールアドレス。これは、URLとして表現できる連絡先（Skype、Twitter、Facebookなど）には使用しないこと。"
* telecom.value ^comment = "Additional text data such as phone extension numbers, or notes about use of the contact are sometimes included in the value.\r\n\r\n連絡先の番号やメールアドレス"
* telecom.use ^short = "home | work | temp | old | mobile - purpose of this contact point 【詳細参照】"
* telecom.use ^comment = "Applications can assume that a contact is current unless it explicitly says that it is temporary or old.  
患者の連絡先の種別をValueSet(ContactPointUse)より選択する。  
- home : 自宅
- work : 職場
- temp : 一時的
- old : 以前の
- mobile : モバイル機器"
* telecom.rank ^comment = "Note that rank does not necessarily follow the order in which the contacts are represented in the instance.\r\n\r\n連絡先の使用順序（1 = 最高）"
* telecom.period ^comment = "A Period specifies a range of time; the context of use will specify whether the entire range applies (e.g. \"the patient was an inpatient of the hospital for this time range\") or one value from the range applies (e.g. \"give to the patient between these two times\").\n\nPeriod is not used for a duration (a measure of elapsed time). See [Duration](http://hl7.org/fhir/R4/datatypes.html#Duration).  
連絡先が使用されていた/されている期間"
* gender ^definition = "Administrative Gender - the gender that the patient is considered to have for administration and record keeping purposes.\r\n管理上の性別-患者が管理および記録管理の目的で持つと見なされる性別。"
* gender ^comment = "The gender might not match the biological sex as determined by genetics or the individual's preferred identification. Note that for both humans and particularly animals, there are other legitimate possibilities than male and female, though the vast majority of systems and contexts only support male and female.  Systems providing decision support or enforcing business rules should ideally do this on the basis of Observations dealing with the specific sex or gender aspect of interest (anatomical, chromosomal, social, etc.)  However, because these observations are infrequently recorded, defaulting to the administrative gender is common practice.  Where such defaulting occurs, rule enforcement should allow for the variation between administrative and biological, chromosomal and other gender aspects.  For example, an alert about a hysterectomy on a male should be handled as a warning or overridable error, not a \"hard\" error.  See the Patient Gender and Sex section for additional information about communicating patient gender and sex.\r\n\r\n患者の性別をValueSet(AdministrativeGender)より選択する。\r\nmale 男性\r\nfemale 女性\r\nother その他\r\nunknown 不明"
* birthDate ^short = "The date of birth for the individual　個人の生年月日"
* birthDate ^definition = "The date of birth for the individual.\r\n個人の生年月日"
* birthDate ^comment = "At least an estimated year should be provided as a guess if the real DOB is unknown  There is a standard extension \"patient-birthTime\" available that should be used where Time is required (such as in maternity/infant care systems).  
実際の生年月日が不明な場合は、少なくとも推定年を推測として提供する必要があり、時間が必要な場合（出産/乳児ケアシステムなど）に使用できる標準の拡張extension「patient-birthTime」がある。  
患者の生年月日をYYYY-MM-DD形式で入れる。  
例：1945-08-23"
* deceased[x] ^short = "Indicates if the individual is deceased or not　個人が死亡しているかどうかを示す"
* deceased[x] ^definition = "Indicates if the individual is deceased or not.\r\n個人が死亡しているかどうかを示す。"
* deceased[x] ^comment = "If there's no value in the instance, it means there is no statement on whether or not the individual is deceased. Most systems will interpret the absence of a value as a sign of the person being alive.  
値がない場合は、個人が死亡したかどうかについてのステートメントがないことを意味し、ほとんどのシステムは、値がないことを人が生きていることの兆候として解釈する。  
患者が死亡しているかどうかを示す  
deceasedBooleanまたはdeceasedDateTimeのどちらかに値が入る  
- deceasedBoolean : true(死亡) / false(生存)  
- deceasedDateTime : 患者の死亡日時"
* address ^short = "An address for the individual　個人の住所 【詳細参照】"
* address ^definition = "An address for the individual.\r\n個人の住所。"
* address ^comment = "Patient may have multiple addresses with different uses or applicable periods.\r\n患者は、異なる用途または適用可能な期間で複数の住所を持っている可能性がある。\r\n\r\n【JP Core仕様】FHIRデータ型仕様に従って、以下の案とした。  
- 住所が構造化されている場合、住所パート Address.country、Address.postalcode、Address.state、Address.city、Address.line に分割して記載する
- 住所が構造化されていない場合は、Address.text に記述する
- 各住所パートとtext は、両方存在してもよい

※診療文書構造化記述規約等では、streetAddressLine (FHIRではlineに対応) に指定するとなっていた。"
* address.use ^short = "home | work | temp | old | billing - purpose of this address　住所の用途 【詳細参照】"
* address.use ^definition = "The purpose of this address.\r\n住所の用途"
* address.use ^comment = "Applications can assume that an address is current unless it explicitly says that it is temporary or old.\r\n\r\n住所の用途をValueSet(AddressUse)より選択する。  
- home : 自宅
- work : 職場
- temp : 一時的
- old : 以前の
- billing : 請求書、インボイス、領収書などの送付用"
* address.type ^short = "postal | physical | both 【詳細参照】"
* address.type ^definition = "Distinguishes between physical addresses (those you can visit) and mailing addresses (e.g. PO Boxes and care-of addresses). Most addresses are both.\r\n\r\n住所（訪問できる住所）と郵送先住所（私書箱や気付住所など）を区別する。ほとんどのアドレスは両方。"
* address.type ^comment = "The definition of Address states that \"address is intended to describe postal addresses, not physical locations\". However, many applications track whether an address has a dual purpose of being a location that can be visited as well as being a valid delivery destination, and Postal addresses are often used as proxies for physical locations (also see the [Location](location.html#) resource).  
住所の種類をValueSet(AddressType)より選択する。  
- postal : 郵送先 - 私書箱、気付の住所
- physical : 訪れることのできる物理的な住所
- both : postalとphysicalの両方"
* address.text ^short = "Text representation of the address　住所のテキスト表現 【詳細参照】"
* address.text ^definition = "Specifies the entire address as it should be displayed e.g. on a postal label. This may be provided instead of or as well as the specific parts.  
表示するアドレス全体を指定する  
例：郵便ラベル。これは、特定の部品の代わりに、または特定の部品と同様に提供される場合がある。"
* address.text ^comment = "Can provide both a text representation and parts. Applications updating an address SHALL ensure that  when both text and parts are present,  no content is included in the text that isn't found in a part.  
テキスト表現とパーツの両方を提供できる。アドレスを更新するアプリケーションは、テキストとパーツの両方が存在する場合、パーツにないコンテンツはテキストに含まれないようにする必要がある。  
- 住所を(都道府県や市町村などに)分離して管理していない場合は、textに入れる。  
- 住所を(都道府県や市町村などに)分離して管理している場合でも、まとめてtextに入れること。  
- 郵便番号は含めない。  

例：東京都文京区本郷7-3-1"
* address.line ^short = "Street name, number, direction & P.O. Box etc.ストリート名や番地など 【詳細参照】"
* address.line ^definition = "This component contains the house number, apartment number, street name, street direction,  P.O. Box number, delivery hints, and similar address information.\r\nこのコンポーネントには、家番号、アパート番号、通りの名前、通りの方向、P.O。が含まれる。ボックス番号、配達のヒント、および同様の住所情報など。"
* address.line ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size\r\n１MBを超えないこと。  
【JP Core仕様】state要素とcity要素で表現しなかったそのあとの住所部分を番地以降の部分も含めてすべていれる。  
英数字は半角でも全角でもよい。文字列の前後および途中に空白文字を含めないこと。  
繰り返し要素が許されているので、区切りを表現したい場合には、複数要素に分けて格納してもよい。  

例：本郷7-3-1  
例：大字石神９７６  
例：藤崎町大字藤崎字西村1-2 春山荘201号室"
* address.city ^short = "Name of city, town etc.　市区町村名 【詳細参照】"
* address.city ^definition = "The name of the city, town, suburb, village or other community or delivery center.\r\n市、町、郊外、村、その他のコミュニティまたは配達センターの名前。"
* address.city ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size\r\n１MBを超えないこと。  
【JP Core仕様】郡市区町村部分だけを「郡」「市」「区」「町」「村」などの文字を含めて設定する。 例：文京区"
* address.district ^short = "District name (aka county) 【詳細参照】"
* address.district ^comment = "District is sometimes known as county, but in some regions 'county' is used in place of city (municipality), so county name should be conveyed in city instead.\r\n【JP Core仕様】日本の住所では使用しない。"
* address.state ^short = "Sub-unit of country (abbreviations ok)　国の次の地区単位 【詳細参照】"
* address.state ^definition = "Sub-unit of a country with limited sovereignty in a federally organized country. A code may be used if codes are in common use (e.g. US 2 letter state codes).\r\n国の主権が制限されている国のサブユニット。日本の場合、都道府県名。"
* address.state ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size\r\n１MBを超えないこと。  
都道府県名。「都」「道」「府」「県」のそれぞれの文字を含める。 例：東京都"
* address.postalCode ^short = "Postal code for area 【詳細参照】"
* address.postalCode ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size\r\n１MBを超えないこと。  
郵便番号。日本の郵便番号の場合には3桁数字とハイフン1文字と4桁数字からなる半角８文字、または最初の3桁だけの3文字のいずれかとする。 例：113-8655"
* address.country ^short = "Country (e.g. can be ISO 3166 2 or 3 letter code)国名またはISO 3166コード"
* address.country ^definition = "Country - a nation as commonly understood or generally accepted.\r\n国-一般的に理解されている、または一般的に受け入れられている国の国名かコード。"
* address.country ^comment = "ISO 3166 3 letter codes can be used in place of a human readable country name.  
ISO 3166 3文字コードは、人間が読める国名の代わりに使用する。  
ISO 3166の2文字または3文字のコード  
日本であれば、jpまたはjpn"
* address.period ^short = "Time period when address was/is in use　住所が使用されていた（いる）期間"
* address.period ^definition = "Time period when address was/is in use.\r\n住所が使用されていた（いる）期間"
* address.period ^comment = "A Period specifies a range of time; the context of use will specify whether the entire range applies (e.g. \"the patient was an inpatient of the hospital for this time range\") or one value from the range applies (e.g. \"give to the patient between these two times\").\nPeriod is not used for a duration (a measure of elapsed time). See [Duration](http://hl7.org/fhir/R4/datatypes.html#Duration).  
住所が使用されていた/されている期間。  
期間は時間の範囲を指定する。使用状況はその期間全体に適用されるか、範囲から1つの値が適用される。  
期間は、時間間隔（経過時間の測定値）には使用されない。"
* maritalStatus ^short = "Marital (civil) status of a patient　患者の婚姻（市民）状態 【詳細参照】"
* maritalStatus ^definition = "This field contains a patient's most recent marital (civil) status.\r\nこのフィールドは患者の最新の婚姻（市民）状態が含む。"
* maritalStatus ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.  
患者の婚姻関係をValueSet(Marital Status Codes)より選択する。  
- A : 婚姻取消・無効
- D : 離婚
- I : 暫定法令
- L : 法的別居中
- M : 既婚
- P : 一夫多妻制
- S : 生涯独身・非婚
- T : 同棲
- U : 未婚
- W : 未亡人
- UNK : 不明"
* multipleBirth[x] ^short = "Whether patient is part of a multiple birth　患者が多胎出産の一人かどうか"
* multipleBirth[x] ^definition = "Indicates whether the patient is part of a multiple (boolean) or indicates the actual birth order (integer).\r\n患者が多胎児の一人であるか（boolean）、実際の出生順位（integer）であるかを示す。"
* multipleBirth[x] ^comment = "Where the valueInteger is provided, the number is the birth number in the sequence. E.g. The middle birth in triplets would be valueInteger=2 and the third born would have valueInteger=3 If a boolean value was provided for this triplets example, then all 3 patient records would have valueBoolean=true (the ordering is not indicated).  
multipleBirthBooleanまたはmultipleBirthIntegerのどちらかに値が入る  
- multipleBirthBoolean : 多胎出産時かどうか  
３つ子の例にbooleanが指定された場合、3つの患者レコードすべてがvalueBoolean = trueになる（順序は示されない）  
- multipleBirthInteger : 多胎出産時の出生順位  
たとえば、３つ子の２番目の生まれはvalueInteger = 2で、3番目の生まれはvalueInteger = 3になる"
* multipleBirth[x] ^requirements = "For disambiguation of multiple-birth children, especially relevant where the care provider doesn't meet the patient, such as labs.\r\n多産児の曖昧性解消、特にラボなど、医療提供者が患者に会わない場合に関連する。"
* photo ^short = "Image of the patient　患者の画像"
* photo ^definition = "Image of the patient.\r\n患者の画像。"
* photo ^comment = "Guidelines:  
- Use id photos, not clinical photos.  
- Limit dimensions to thumbnail.  
- Keep byte count low to ease resource updates

ガイドライン：  
- 臨床写真ではなく、身分証明写真を使用すること
- 寸法をサムネイルに制限する  
- リソースの更新を容易にするため、バイト数を少なくすること"
* photo ^requirements = "Many EHR systems have the capability to capture an image of the patient. Fits with newer social media usage too.\r\n\r\n多くのEHRシステムには、患者の画像をキャプチャする機能がある。より新しいソーシャルメディアの使用にも適合する。"
* contact ^short = "A contact party (e.g. guardian, partner, friend) for the patient　患者の連絡先者（例：保護者、パートナー、友人）"
* contact ^definition = "A contact party (e.g. guardian, partner, friend) for the patient.\r\n\r\n患者の連絡先者（例：保護者、パートナー、友人）。"
* contact ^comment = "Contact covers all kinds of contact parties: family members, business contacts, guardians, caregivers. Not applicable to register pedigree and family ties beyond use of having contact.\r\n\r\n連絡先には、家族、取引先、保護者、介護者など、あらゆる種類の連絡先が含まれる。連絡先として使用しない親戚や家族を登録するためには適用されない。"
* contact ^requirements = "Need to track people you can contact about the patient.\r\n\r\n患者について連絡できる人を確認する必要がある。"
* contact.relationship ^short = "The kind of relationship 【詳細参照】"
* contact.relationship ^definition = "The nature of the relationship between the patient and the contact person.\r\n\r\n患者と連絡先の関係性。"
* contact.relationship ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.  
患者との関係性をValueSet(PatientContactRelationship)より選択する。  
- C : 緊急連絡先
- E : 雇用者
- F : 連邦政府機関
- I : 保険会社
- N : 近親者
- S : 州政府機関
- U : 不明"
* contact.relationship ^requirements = "Used to determine which contact person is the most relevant to approach, depending on circumstances.\r\n\r\n状況に応じて、アプローチするのに最適な関係者を決定するために使用される。"
* contact.name ^definition = "A name associated with the contact person.\r\n\r\n連絡先に登録された名前。"
* contact.name ^requirements = "Contact persons need to be identified by name, but it is uncommon to need details about multiple other names for that contact person.\r\n\r\n連絡先は名前で識別する必要があるが、その連絡先に複数の名前が必要になることはまれである。"
* contact.telecom ^definition = "A contact detail for the person, e.g. a telephone number or an email address.\r\n\r\n連絡先に登録された連絡方法（電話番号やメールアドレスなど）。"
* contact.telecom ^comment = "Contact may have multiple ways to be contacted with different uses or applicable periods.  May need to have options for contacting the person urgently, and also to help with identification.\r\n\r\n連絡先には、さまざまな用途または適用期間で連絡を取るための複数の方法がある。その人に緊急に連絡する際の連絡先を確認する必要がある。"
* contact.telecom ^requirements = "People have (primary) ways to contact them in some way such as phone, email.\r\n\r\n電話、電子メールなどの（優先する）連絡方法を確認する必要がある。"
* contact.address ^definition = "Address for the contact person.\r\n連絡先の住所。"
* contact.address ^requirements = "Need to keep track where the contact person can be contacted per postal mail or visited.\r\n郵送ないし訪問により連絡を取ることができるよう注意する必要があるため。"
* contact.gender ^definition = "Administrative Gender - the gender that the contact person is considered to have for administration and record keeping purposes.\r\n管理上の性別-連絡先担当者が管理および記録管理のために持っていると考えられる性別。"
* contact.gender ^requirements = "Needed to address the person correctly.\r\nその人に正しく話しかけるために必要である。"
* contact.organization only Reference(JP_Organization)
* contact.organization ^definition = "Organization on behalf of which the contact is acting or for which the contact is working.\r\n連絡先が主として活動する、または勤務している組織。"
* contact.organization ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n連絡先に関連する組織"
* contact.period ^definition = "The period during which this contact person or organization is valid to be contacted relating to this patient.\r\nこの患者に関連して、この連絡担当者または組織に連絡することが有効な期間。"
* communication ^short = "A language which may be used to communicate with the patient about his or her health　彼または彼女の健康について患者と会話する際に使用する言語"
* communication ^definition = "A language which may be used to communicate with the patient about his or her health.\r\n彼または彼女の健康について患者と会話する際に使用する言語。"
* communication ^comment = "If no language is specified, this *implies* that the default local language is spoken.  If you need to convey proficiency for multiple modes, then you need multiple Patient.Communication associations.   For animals, language is not a relevant field, and should be absent from the instance. If the Patient does not speak the default local language, then the Interpreter Required Standard can be used to explicitly declare that an interpreter is required.  
言語が指定されていない場合、デフォルトのローカル言語が話されていることを意味する。複数のモードの習熟度を伝える必要がある場合は、複数のPatient.Communicationアソシエーションが必要である。動物の場合、言語は関連するフィールドではないため、インスタンスから除外する必要がある。患者がデフォルトの現地言語を話さない場合、通訳者が必要であることを明示的に宣言するために、通訳者必須基準を使用できる。"
* communication ^requirements = "If a patient does not speak the local language, interpreters may be required, so languages spoken and proficiency are important things to keep track of both for patient and other persons of interest.  
患者が現地の言語を話さない場合、通訳が必要になる場合があるため、話せる言語と習熟度は、患者と関心のある他の人の両方にとって注意すべき重要な事項である。"
* communication.language ^short = "The language which can be used to communicate with the patient about his or her health 【詳細参照】"
* communication.language ^definition = "The ISO-639-1 alpha 2 code in lower case for the language, optionally followed by a hyphen and the ISO-3166-1 alpha 2 code for the region in upper case; e.g. \"en\" for English, or \"en-US\" for American English versus \"en-EN\" for England English.  
ISO-639-1 alpha 2コード小文字で言語を、またオプションとしてハイフンとISO-3166-1 alpha 2コード大文字を続けて地域を表す。たとえば、英語の場合は「en」、アメリカ英語の場合は「en-US」、イギリス英語の場合は「en-EN」である。"
* communication.language ^comment = "The structure aa-BB with this exact casing is one the most widely used notations for locale. However not all systems actually code this but instead have it as free text. Hence CodeableConcept instead of code as the data type.\r\n\r\n患者とコミュニケーションするときに使用できる言語をValueSet(CommonLanguages)より選択する。
- de : ドイツ語
- en : 英語
- fr : フランス語
- ja : 日本語
- ko : 韓国語  
など"
* communication.language ^requirements = "Most systems in multilingual countries will want to convey language. Not all systems actually need the regional dialect.\r\n多言語の国のほとんどのシステムは、言語を伝えたいと考えられる。 すべてのシステムが実際に地域の方言を必要とするわけではない。"
* communication.preferred ^definition = "Indicates whether or not the patient prefers this language (over other languages he masters up a certain level).\r\n\r\n患者がこの言語を優先するかどうかを示す（他の言語よりも特定レベルまで習得している）。"
* communication.preferred ^comment = "This language is specifically identified for communicating healthcare information.\r\n\r\nこの言語は、医療情報を伝えるために特に識別される。\r\n患者がこの言語を習得している場合はtrue、そうでなければfalseを設定する。"
* communication.preferred ^requirements = "People that master multiple languages up to certain level may prefer one or more, i.e. feel more confident in communicating in a particular language making other languages sort of a fall back method.\r\n\r\n特定のレベルまで複数の言語を習得している人は、複数の言語を選択する可能性がある。つまり、特定の言語でのコミュニケーションに自信を持ち、他の言語を一種の備えとしている。"
* generalPractitioner only Reference(JP_Organization or JP_Practitioner or JP_PractitionerRole)
* generalPractitioner ^short = "Patient's nominated primary care provider　患者が指名するケア提供者"
* generalPractitioner ^definition = "Patient's nominated care provider.\r\n患者が指名するケア提供者"
* generalPractitioner ^comment = "This may be the primary care provider (in a GP context), or it may be a patient nominated care manager in a community/disability setting, or even organization that will provide people to perform the care provider roles.  It is not to be used to record Care Teams, these should be in a CareTeam resource that may be linked to the CarePlan or EpisodeOfCare resources.\nMultiple GPs may be recorded against the patient for various reasons, such as a student that has his home GP listed along with the GP at university during the school semesters, or a \"fly-in/fly-out\" worker that has the onsite GP also included with his home GP to remain aware of medical issues.  
Jurisdictions may decide that they can profile this down to 1 if desired, or 1 per type.  
これはプライマリケア提供者(GPを含む)である場合もあれば、コミュニティ/障害を持つ患者指定のケアマネージャーである場合もある。ケアチームの記録には使用されない。これらはケアプランまたはEpisodeOfCareリソースにリンクされるCareTeamリソースに含まれている必要がある。複数のGPは、学期中の大学GPと共にリストされた家庭GPなどの学生や、「フライイン/フライアウト」労働者など、さまざまな理由で患者に対して記録される場合がある。また、医学的問題を認識し続けるために家庭GPに含まれる。  
管轄区域は、必要に応じてこれを1、またはタイプごとに1にプロファイルできると決定する場合がある。"
* managingOrganization only Reference(JP_Organization)
* managingOrganization ^short = "Organization that is the custodian of the patient record　患者記録の管理者である組織"
* managingOrganization ^definition = "Organization that is the custodian of the patient record.\r\n患者記録の管理者である組織。"
* managingOrganization ^comment = "There is only one managing organization for a specific patient record. Other organizations will have their own Patient record, and may use the Link property to join the records together (or a Person resource which can include confidence ratings for the association).\r\n\r\n特定の患者記録を管理する組織は1つだけである。他の組織には独自の患者レコードがあり、Linkプロパティを使用してレコードを結合する場合がある（または、関連付けの信頼性評価を含めることができる個人リソース）"
* managingOrganization ^requirements = "Need to know who recognizes this patient record, manages and updates it.\r\n\r\nこの患者記録を誰が認識し、管理し、更新するかを知る必要がある。"
* link ^short = "Link to another patient resource that concerns the same actual person　事実上の同一患者をリンクする別のPatientリソース"
* link ^definition = "Link to another patient resource that concerns the same actual patient.\r\n\r\n事実上の同一患者をリンクする別のPatientリソース。"
* link ^comment = "There is no assumption that linked patient records have mutual links.\r\n\r\nリンクされた患者記録に相互リンクがあるという仮定はない。"
* link ^requirements = "There are multiple use cases:   \n\n* Duplicate patient records due to the clerical errors associated with the difficulties of identifying humans consistently, and \n* Distribution of patient information across multiple servers

複数のユースケースがある。  
- 事務的なエラーのため一貫して人間を特定することが困難であり患者の記録が重複している
- 複数のサーバにわたり患者情報が配布されている"
* link ^isModifierReason = "This element is labeled as a modifier because it might not be the main Patient resource, and the referenced patient should be used instead of this Patient record. This is when the link.type value is 'replaced-by'  この要素は、メインのPatientリソースではない可能性があるため、修飾子としてラベル付けされ、このPatientレコードの代わりに参照された患者を使用する必要がある。link.type値が 'replaced-by'の場合"
* link.other only Reference(JP_Patient or RelatedPerson)
* link.other ^definition = "The other patient resource that the link refers to.\r\n\r\nリンクが参照する他の患者リソース。"
* link.other ^comment = "Referencing a RelatedPerson here removes the need to use a Person record to associate a Patient and RelatedPerson as the same individual.\r\n\r\nここでRelatedPersonを参照すると、Personレコードを使用して患者とRelatedPersonを同じ個人として関連付ける必要がなくなる。"
* link.type ^short = "replaced-by | replaces | refer | seealso 【詳細参照】"
* link.type ^definition = "The type of link between this patient resource and another patient resource.\r\n\r\nこの患者リソースと別の患者リソース間のリンクのタイプ。"
* link.type ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size  
この患者リソースと別の患者リソース間のリンクのタイプをValueSet(LinkType)より選択する。
- replaced-by : このリンクを含む患者リソースは使用しないこと
- replaces : このリンクを含む患者リソースは、現在アクティブな患者レコードである
- refer : このリンクを含む患者リソースは使用中であり、有効であるが、患者に関する主な情報源とは見なされていない
- seealso : このリンクを含む患者リソースは使用中で有効であるが、同じ人物に関するデータが含まれていることがわかっている別の患者リソースを指す"

// ==============================
//   Extension 定義
// ==============================
Extension: JP_Patient_Race
Id: jp-patient-race
Title: "JP Core Patient Race Extension"
Description: "人種(Race)に関する情報を格納するためのExtension。"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Patient_Race"
* ^status = #active
* ^date = "2022-09-26"
* ^context.type = #element
* ^context.expression = "Patient"
* . ^short = "人種に関する情報"
* . ^comment = "人種に関する情報を表現する拡張。  
ValueSetとしてhttp://terminology.hl7.org/CodeSystem/v3-Raceを使用する。  
例： 
- Code : Description
- 2103-3 : White
- 2039-6 : Japanese
- 2040-4 : Korean  
等"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Patient_Race" (exactly)
* value[x] only CodeableConcept
* valueCodeableConcept from $patient-race-vs  (preferred)