// ==============================
//   Profile 定義
// ==============================
Profile: JP_Organization
Parent: Organization
Id: jp-organization
Title: "JP Core Organization Profile"
Description: "このプロファイルはOrganizationリソースに対して、組織情報のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Organization"
* ^status = #active
* ^date = "2022-09-26"
* . ^short = "A grouping of people or organizations with a common purpose/共通の目的を持った人や組織の集まり"
* . ^definition = "A formally or informally recognized grouping of people or organizations formed for the purpose of achieving some form of collective action.  Includes companies, institutions, corporations, departments, community groups, healthcare practice groups, payer/insurer, etc.\r\n\r\n集団行動の何らかの形での達成を目的として結成された、正式または非公式に認められた人々または組織のグループ。企業、機関、企業、部門、コミュニティグループ、医療実践グループ、支払者/保険者などが含まれる。"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    JP_Organization_PrefectureNo named prefectureNo ..1 and
    JP_Organization_InsuranceOrganizationCategory named organizationCategory ..1 and
    JP_Organization_InsuranceOrganizationNo named organizationNo ..1
* extension[prefectureNo] ^short = "都道府県番号２桁を表現するExtension"
* extension[prefectureNo] ^comment = "都道府県番号２桁。Identifier型の拡張を使用する。\r\nvalueには都道府県番号2桁の値を格納し、systemには都道府県番号を表すOID「1.2.392.100495.20.3.21」を指定する。"
* extension[organizationCategory] ^short = "点数表コード１桁（医科１、歯科３）を表現するExtension"
* extension[organizationCategory] ^comment = "点数表コード１桁（医科1、歯科 3）。Identifier型の拡張\r\n「OrganizationCategory」を使用する。systemには点数表番号\r\nを表すOID「1.2.392.100495.20.3.22」を指定する。"
* extension[organizationNo] ^short = "保険医療機関番号７桁を表現するExtension"
* extension[organizationNo] ^comment = "保険医療機関番号７桁。Identifier型の拡張\r\n「InsuranceOrganizationNo」を使用する。systemには医療機関コードを\r\n表すOID「1.2.392.100495.20.3.23」を指定する。"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^short = "Identifies this organization  across multiple systems/複数のシステムでこの組織を識別"
* identifier ^definition = "Identifier for the organization that is used to identify the organization across multiple disparate systems.\r\n\r\n複数の異種システムにまたがって組織を識別するための識別子"
* identifier ^requirements = "Organizations are known by a variety of ids. Some institutions maintain several, and most collect identifiers for exchange with other organizations concerning the organization.\r\n\r\n組織は様々な ID で知られている。いくつかの機関では複数のIDを保持しており、ほとんどの機関では、組織に関する他の組織との交換のためにIDを収集している。"
* identifier ^comment = "もし適切なOID が存在しない場合で、その医療施設が保険医療機関の場合、特定健診・特定保健指導機関のルールに従い以下のルールで設定してもよい。\r\n\r\n医療施設が固有のOID を持っている場合は、そのOID を指定する。医療施設が保険医療機関の場合、特定健診・特定保健指導機関の医療機関コードの OID「1.2.392.200119.6.102.」の末尾に「[1]＋医療機関コード（10 桁）」を指定する。医療機関コードを持たない場合、「[9]＋当該施設の電話番号下 9 桁」を医療機関コードとする。\r\n\r\n例：医療機関コード「1312345670」の場合「1.2.392.200119.6.102.11312345670」"
* identifier contains
    medicalInstitutionCode ..* and
    insurerNumber ..*
* identifier.assigner only Reference(JP_Organization)
* identifier[medicalInstitutionCode] ^comment = "処方箋等の発行医療機関コードを格納するためのIdentifier/Slicing定義。\r\n\r\nsystemはFixed Valueの\r\n```\r\nhttp://jpfhir.jp/fhir/Common/IdSystem/insurance-medical-institution-no\r```\r\nを使用する。\r\n\r\n記載の様式(Wikipediaより転載)\r\n\r\n記載されている10桁の内訳は以下の通りである。\r\n\r\n　・最初の2桁 全国地方公共団体コードの都道府県コード（ISO 3166-2:JP）\r\n\r\n　　・都道府県ごとの番号。\r\n\r\n　・3桁目 点数表番号\r\n\r\n　　・医科は「1」。歯科は「3」。\r\n\r\n　　　・したがって、同一の病院または診療所に医科と歯科が併存する場合にはそれぞれ別のコードが与えられる。\r\n\r\n　　　・そのため、レセプトコンピュータでは一医療機関に対して医科と歯科の両方のコードを設定できるようになっている。\r\n\r\n　　　・ちなみに処方箋は発行されないが、「4」は調剤、「5」は老人保健施設、「6」は訪問看護ステーションである。\r\n\r\n　　・下7桁 医療機関コード\r\n\r\n　　　・地区（2桁）+番号（4桁）+チェックディジット（1桁）で構成される。\r\n\r\n　・7桁の医療機関コードについて\r\n\r\n　　各地域を所管する厚生労働省の地方支分部局である地方厚生局のホームページ等で確認できる。"
* identifier[medicalInstitutionCode].system = "http://jpfhir.jp/fhir/Common/IdSystem/insurance-medical-institution-no" (exactly)
* identifier[medicalInstitutionCode].assigner only Reference(JP_Organization)
* identifier[insurerNumber] ^comment = "健康保険組合などの保険者の保険者番号を表現する際のIdentifier表現に使用する\r\nsystem要素には保険者番号を示すOID\"urn:oid:1.2.392.100495.20.3.61\"を指定する。"
* identifier[insurerNumber].system = "urn:oid:1.2.392.100495.20.3.61" (exactly)
* identifier[insurerNumber].assigner only Reference(JP_Organization)
* active ^short = "Whether the organization's record is still in active use / 組織の記録がまだ有効に使われているかどうか"
* active ^definition = "Whether the organization's record is still in active use.\r\n\r\n組織の記録がまだ現役であるかどうか。"
* active ^comment = "This active flag is not intended to be used to mark an organization as temporarily closed or under construction. Instead the Location(s) within the Organization should have the suspended status. If further details of the reason for the suspension are required, then an extension on this element should be used.\n\nThis element is labeled as a modifier because it may be used to mark that the resource was created in error.\r\n\r\nこのアクティブフラグは、組織を一時的に閉鎖したり、工事中であることを示すために使用されることを意図していない。代わりに、組織内の場所(複数可)は、中断されたステータスを持っている必要がある。一時停止の理由の詳細が必要な場合は、この要素の拡張子を使用する必要がある。\r\n\r\nこの要素は、リソースがエラーで作成されたことをマークするために使用される可能性があるため、修飾子としてラベル付けされている。"
* active ^requirements = "Need a flag to indicate a record is no longer to be used and should generally be hidden for the user in the UI.\r\n\r\nレコードが使用されなくなったことを示すためのフラグが必要で、一般的にUIではユーザのために非表示にする必要がある。"
* type ^short = "Kind of organization / 組織の種類"
* type ^definition = "The kind(s) of organization that this is.\r\n\r\nその種類の組織。"
* type ^comment = "Organizations can be corporations, wards, sections, clinical teams, government departments, etc. Note that code is generally a classifier of the type of organization; in many applications, codes are used to identity a particular organization (say, ward) as opposed to another of the same type - these are identifiers, not codes\n\nWhen considering if multiple types are appropriate, you should evaluate if child organizations would be a more appropriate use of the concept, as different types likely are in different sub-areas of the organization. This is most likely to be used where type values have orthogonal values, such as a religious, academic and medical center.\n\nWe expect that some jurisdictions will profile this optionality to be a single cardinality.\r\n\r\n組織は、企業、病棟、セクション、臨床チーム、政府部門などにすることができる。多くのアプリケーションでは、コードは、特定の組織を識別するために使用されている（と言う、病棟）別の同じタイプのものとは対照的に - これらは識別子ではなく、コードである。\r\n\r\n複数のタイプが適切かどうかを検討する際には、異なるタイプが組織の異なるサブ領域に存在する可能性が高いため、子どもの組織の方がより適切な使用法であるかどうかを評価する必要がある。これは、宗教、学術、医療センターのように、タイプの価値観が直交する場合に使用される可能性が高い。\r\n\r\nいくつかの法域では、このオプション性を単一のカーディナリティとしてプロファイルすると予想される。"
* type ^requirements = "Need to be able to track the kind of organization that this is - different organization types have different uses.\r\n\r\nこれがある組織の種類を追跡することができる必要がある - 異なる組織の種類は、異なる用途を持っている。"
* name ^short = "Name used for the organization / 組織に使用されている名称"
* name ^definition = "A name associated with the organization.\r\n\r\n組織に関連付けられた名前。"
* name ^comment = "If the name of an organization changes, consider putting the old name in the alias column so that it can still be located through searches.\r\n\r\n組織名が変更された場合は、旧名称をエイリアス欄に入れて検索で見つけられるようにすることを検討すべきである。"
* name ^requirements = "Need to use the name as the label of the organization.\r\n\r\n組織のラベルとして名前を使用する必要がある。"
* alias ^short = "A list of alternate names that the organization is known as, or was known as in the past / 組織が知られている、または過去に知られていた別名のリスト"
* alias ^definition = "A list of alternate names that the organization is known as, or was known as in the past.\r\n\r\n組織がその名で知られている、または過去にその名で知られていた代替名のリスト。"
* alias ^comment = "There are no dates associated with the alias/historic names, as this is not intended to track when names were used, but to assist in searching so that older names can still result in identifying the organization.\r\n\r\nこれは、名前がいつ使用されたかを追跡することを目的としたものではなく、古い名前でも組織を特定できるように検索を支援することを目的としているため、別名や歴史的な名前に関連付けられた日付はない。"
* alias ^requirements = "Over time locations and organizations go through many changes and can be known by different names.\n\nFor searching knowing previous names that the organization was known by can be very useful.\r\n\r\n時間の経過とともに、場所や組織はさまざまな変化を経て、さまざまな名前で知ることができる。\r\n\r\n組織が知っている前の名前を知るための検索には、非常に便利なことができる。"
* telecom ^short = "A contact detail for the organization / 組織の連絡先詳細"
* telecom ^definition = "A contact detail for the organization.\r\n\r\n組織の連絡先詳細"
* telecom ^comment = "The use code 'home' is not to be used. Note that these contacts are not the contact details of people who are employed by or represent the organization, but official contacts for the organization itself.\r\n\r\n使用コード「home」は使用しないこと。これらの連絡先は、組織に雇用されている人や組織を代表する人の連絡先ではなく、組織自体の公式な連絡先であることに注意すること。"
* telecom ^requirements = "Human contact for the organization.\r\n\r\n組織のヒューマンコンタクト。"
* address ^short = "An address for the organization / 組織の住所"
* address ^definition = "An address for the organization.\r\n\r\n組織の住所"
* address ^comment = "Organization may have multiple addresses with different uses or applicable periods. The use code 'home' is not to be used.\r\n\r\n組織は、用途や適用期間が異なる複数の住所を持っている場合がある。使用コード「home」は使用しないこと。"
* address ^requirements = "May need to keep track of the organization's addresses for contacting, billing or reporting requirements.\r\n\r\n連絡、請求、または報告のために、組織のアドレスを追跡する必要がある場合がある。"
* partOf only Reference(JP_Organization)
* partOf ^short = "The organization of which this organization forms a part"
* partOf ^definition = "The organization of which this organization forms a part.\r\nこの組織が一部を構成する組織"
* partOf ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* contact ^short = "Contact for the organization for a certain purpose　特定の目的のための組織の連絡先"
* contact ^definition = "Contact for the organization for a certain purpose.\r\n特定の目的のための組織の連絡先"
* contact ^comment = "Where multiple contacts for the same purpose are provided there is a standard extension that can be used to determine which one is the preferred contact to use.\r\n同じ目的で複数の連絡先が提供されている場合、どの連絡先を使用するのが好ましいかを判断するために使用できる標準の拡張extension がある。"
* contact ^requirements = "Need to keep track of assigned contact points within bigger organization.\r\nより大きな組織内で割り当てられた連絡先を追跡する必要がある。"
* contact.name only JP_HumanName
* endpoint ^short = "Technical endpoints providing access to services operated for the organization　　組織のために運営されているサービスへのアクセスを提供する技術的エンドポイント"
* endpoint ^definition = "Technical endpoints providing access to services operated for the organization.\r\n組織のために運営されているサービスへのアクセスを提供する技術的エンドポイント"
* endpoint ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* endpoint ^requirements = "Organizations have multiple systems that provide various services and need to be able to define the technical connection details for how to connect to them, and for what purpose.\r\n組織にはさまざまなサービスを提供する複数のシステムがあり、それらに接続する方法と目的について、技術的な接続の詳細を定義できる必要がある。"

// ==============================
//   Extension 定義
// ==============================
Extension: JP_Organization_InsuranceOrganizationCategory
Id: jp-organization-insuranceorganizationcategory
Title: "JP Core Organization InsuranceOrganizationCategory Extension"
Description: "点数表コード１桁（医科１、歯科３）表現するためのExtension。 JP Core Organizationプロファイルで利用されることを想定しているが、他のリソースでも利用可能である"
* ^url = $JP_Organization_InsuranceOrganizationCategory
* ^status = #active
* ^date = "2022-09-26"
* ^context.type = #element
* ^context.expression = "Organization"
* . ^short = "点数表コード１桁（医科1、歯科３）"
* . ^comment = "点数表コード１桁（医科1、歯科３）。Identifier型の拡張\r\n「InsuranceOrganizationCategory」を使用する。systemには点数表番号\r\nを表すOID「1.2.392.100495.20.3.22」を指定する。"
* url = $JP_Organization_InsuranceOrganizationCategory (exactly)
* value[x] only Coding
* valueCoding from JP_MedicalFeeScoreType_VS (preferred)
* valueCoding.system = "urn:oid:1.2.392.100495.20.3.22" (exactly)
* valueCoding.system ^definition = "点数表番号の名前空間を識別するURIを指定。固定値。"
* valueCoding.code ^definition = "点数表コード１桁「1：医科」、「3：歯科」、「4：調剤」、「5：老人保健施設」、「6：訪問看護ステーション」」。"

Extension: JP_Organization_InsuranceOrganizationNo
Id: jp-organization-insuranceorganizationno
Title: "JP Core Organization InsuranceOrganizationNo Extension"
Description: "保険医療機関番号７桁を表現するためのExtension。 JP Core Organizationプロファイルで利用されることを想定しているが、他のリソースでも利用可能である"
* ^url = $JP_Organization_InsuranceOrganizationNo
* ^status = #active
* ^date = "2022-09-26"
* ^context.type = #element
* ^context.expression = "Organization"
* . ^short = "保険医療機関番号７桁"
* . ^comment = "保険医療機関番号７桁。Identifier型の拡張\r\n「InsuranceOrganizationNo」を使用する。systemには医療機関コードを\r\n表すOID「1.2.392.100495.20.3.23」を指定する。\r\n\r\n「[処方情報 HL7FHIR 記述仕様](https://std.jpfhir.jp/stddoc/ePrescriptionDataFHIR_v1x.pdf)」の定義をベースにしているが、URLを以下に変更している \r\nhttp://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationNo"
* url = $JP_Organization_InsuranceOrganizationNo (exactly)
* value[x] only Identifier
* value[x].system = "urn:oid:1.2.392.100495.20.3.23" (exactly)
* value[x].system ^definition = "保険医療機関コードの名前空間を識別するURIを指定。固定値。"
* value[x].value ^definition = "保険医療機関番号７桁。半角数字で７桁固定。"

Extension: JP_Organization_PrefectureNo
Id: jp-organization-prefectureno
Title: "JP Core Organization PrefectureNo Extension"
Description: """都道府県番号２桁を表現するためのExtension。
JP Core Organizationプロファイルで利用されることを想定しているが、他のリソースでも利用可能である"""
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_PrefectureNo"
* ^status = #active
* ^date = "2022-09-26"
* ^context.type = #element
* ^context.expression = "Organization"
* . ^short = "都道府県番号2桁"
* . ^comment = "都道府県番号２桁。Identifier型の拡張を使用する。\r\nvalueには都道府県番号2桁の値を格納し、systemには都道府県番号を表すOID「1.2.392.100495.20.3.21」を指定する。"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_PrefectureNo" (exactly)
* value[x] only Coding
* valueCoding from JP_PrefectureNumber_VS (preferred)
* valueCoding.system = "urn:oid:1.2.392.100495.20.3.21" (exactly)
* valueCoding.system ^definition = "都道府県番号の名前空間を識別するURIを指定"
* valueCoding.code ^definition = "都道府県番号コード。 例）北海道　 \"01\""
