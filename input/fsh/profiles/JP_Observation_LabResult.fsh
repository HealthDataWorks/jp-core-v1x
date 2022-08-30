// ==============================
//   Profile 定義
// ==============================
Profile: JP_Observation_LabResult
Parent: JP_Observation_Common
Id: jp-observation-labresult
Title: "JP Core Observation LabResult Profile"
Description: "このプロファイルはObservationリソースに対して、検体検査結果のデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_LabResult"
* ^status = #draft
* . ^short = "検体検査結果"
* . ^definition = "Measurements and simple assertions made about a patient, device or other subject.\r\n\r\n検体検査結果の格納に使用する。"
* . ^comment = "すべてのObservation（検査測定や観察事実）の制約プロファイル"
* identifier ^definition = "A unique identifier assigned to this observation.\r\n\r\nこの検査項目に割り当てられた一意の識別子。リソースの識別子やシステム的なシーケンスではなく、ビジネスID。"
* identifier ^comment = "【JP Core仕様】当該検査項目に対して、施設内で割り振られる一意の識別子があればそれを使用する。なければ次のルールを参考に一意となる識別子を生成し設定する。\r\n\r\nアプリケーション側のデータベースにおけるフィールド長の定義については、最低64バイトを確保すること。\r\n\r\n--- 参考 ---\r\n\r\n次の項目を順にセパレータ「_(アンダースコア)」で連結し、 identifier.value に設定する。グループ項目でない場合など、該当コード／番号がない場合はセパレータを連続で連結する。各コードはローカルコードを使用し、必ず設定できること。\r\n\r\n　１．ORC-2(依頼者オーダ番号)　SS-MIX2の15桁前ゼロ形式の番号\r\n\r\n　２．OBR-4(検査項目ID)　検査セットの識別コード\r\n\r\n　３．SPM-4(検体タイプ)\r\n\r\n　４．OBX-3(検査項目)\r\n\r\n　５．OBX-4(検査副ID)・・・オプション。必要に応じて使用。\r\n\r\n形式：[ORC-2]_[OBR-4]_[SPM-4]_[OBX-3]（_[OBX-4]）"
* identifier.use ^definition = "The purpose of this identifier.\r\n\r\nこの識別子の目的。"
* identifier.use ^comment = "Applications can assume that an identifier is permanent unless it explicitly says that it is temporary.\r\n\r\nアプリケーションは、identifierが一時的であると明示的に述べられない限り、永続的であると想定できる。"
* identifier.system ^comment = "Identifier.system is always case sensitive."
* identifier.value ^definition = "The portion of the identifier typically relevant to the user and which is unique within the context of the system.\r\n\r\nシステムのコンテキスト内で一意の識別子となる文字列を設定。"
* basedOn only Reference(ServiceRequest)
* basedOn ^definition = "A plan, proposal or order that is fulfilled in whole or in part by this event.  For example, a MedicationRequest may require a patient to have laboratory test performed before  it is dispensed.\r\n\r\n本プロファイルでは、検体検査オーダに関する情報。"
* basedOn ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n【JP Core仕様】オーダ情報がある場合、本プロファイルでは ServiceRequest のリソースを参照する。オーダIDの情報はここで使用する。"
* partOf ^definition = "A larger event of which this particular Observation is a component or step.  For example,  an observation as part of a procedure.\r\n\r\nこのリソースが一部として、あるいは手順の一つとして含まれるより大きなイベント。"
* partOf ^comment = "To link an Observation to an Encounter use `encounter`.  See the  [Notes](observation.html#obsgrouping) below for guidance on referencing another Observation.\r\n\r\n【JP Core仕様】当面は使用しない。"
* status ^definition = "The status of the result value.\r\n\r\n結果値の状態。"
* status ^comment = "This element is labeled as a modifier because the status contains codes that mark the resource as not currently valid.\r\n\r\n【JP Core仕様】v2.5の「F」に相当する値は「final」であるが、ここでは 必須コード表「ObservationStatus」より、全てのコード値を使用可とする。\r\n\r\n(registered | preliminary | final | amended |   corrected | cancelled | entered-in-error | unknown)"
* category 1..
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains laboratory 1..1
* category[laboratory] = $observation-category#laboratory
* category ^definition = "A code that classifies the general type of observation being made.\r\n\r\n行われた検査の一般的なタイプの分類。取得、表示の際のフィルタリングに使用。"
* category ^comment = "In addition to the required category valueset, this element allows various categorization schemes based on the owner’s definition of the category and effectively multiple categories can be used at once.  The level of granularity is defined by the category concepts in the value set.\r\n\r\n【JP Core仕様】推奨コード表「ObservationCategoryCodes」より、本プロファイルでは「laboratory」固定とする。\r\n\r\n(social-history | vital-signs | imaging | laboratory | procedure | survey | exam | therapy | activity)"
* category.coding ^comment = "Codes may be defined very casually in enumerations, or code lists, up to very formal definitions such as SNOMED CT - see the HL7 v3 Core Principles for more information.  Ordering of codings is undefined and SHALL NOT be used to infer meaning. Generally, at most only one of the coding values will be labeled as UserSelected = true.\r\n\r\n【JP Core仕様】推奨コード表「ObservationCategoryCodes」より、本プロファイルでは「laboratory」固定とする。"
* code from JP_ObservationLabResultCode_VS (preferred)
* code ^definition = "Describes what was observed. Sometimes this is called the observation \"name\".\r\n\r\n検査の内容の説明。検査名称。"
* code ^comment = "*JLAC10"
* code ^binding.description = "MEDIS 臨床検査マスター"
* code.coding 1..
* code.coding ^definition = "A reference to a code defined by a terminology system.\r\n\r\nコード体系によって定義されたコードへの参照。"
* code.coding ^comment = "Codes may be defined very casually in enumerations, or code lists, up to very formal definitions such as SNOMED CT - see the HL7 v3 Core Principles for more information.  Ordering of codings is undefined and SHALL NOT be used to infer meaning. Generally, at most only one of the coding values will be labeled as UserSelected = true.\r\n\r\n【JP Core仕様】SS-MIX2にならい、標準コード、ローカルコードの2つを設定可能とし、いずれか一方は必須とする。さらにJLAC10とJLAC11などの複数の標準コードも設定できるよう、上限は設けない。\r\n\r\n標準コード、ローカルコードの2つまで格納可。順不同。\r\nSS-MIX2だとCWE.1 ～CWE.3に標準コード、CWE.4～CWE.6にローカルコード、など（順不同）。"
* code.coding.system ^definition = "The identification of the code system that defines the meaning of the symbol in the code.\r\n\r\nコード体系。"
* code.coding.system ^comment = "The URI may be an OID (urn:oid:...) or a UUID (urn:uuid:...).  OIDs and UUIDs SHALL be references to the HL7 OID registry. Otherwise, the URI should come from HL7's list of FHIR defined special URIs or it should reference to some definition that establishes the system clearly and unambiguously.\r\n\r\n【JP Core仕様】標準コードの場合、JLAC10を表すURIを設定。\r\n\r\nURIは本WGで定義する。"
* code.coding.version ^comment = "Where the terminology does not clearly define what string should be used to identify code system versions, the recommendation is to use the date (expressed in FHIR date format) on which that version was officially published as the version date."
* code.coding.code ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size"
* code.coding.display ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size"
* code.coding.userSelected ^definition = "Indicates that this coding was chosen by a user directly - e.g. off a pick list of available items (codes or displays).\r\n\r\nこのコードが利用者によって、例えば利用可能なコードの選択リストから、など、直接選択されたものであることを示す。"
* code.coding.userSelected ^comment = "Amongst a set of alternatives, a directly chosen code is the most appropriate starting point for new translations. There is some ambiguity about what exactly 'directly chosen' implies, and trading partner agreement may be needed to clarify the use of this element and its consequences more completely.\r\n\r\n【JP Core仕様】当面は未使用とする。"
* code.text 1..
* code.text ^definition = "A human language representation of the concept as seen/selected/uttered by the user who entered the data and/or which represents the intended meaning of the user.\r\n\r\nコードの表示名。報告書などに記載する場合に使用する表示名。コードを複数指定した場合(標準コード、ローカルコード)、その一般的な表現。"
* code.text ^comment = "Very often the text is the same as a displayName of one of the codings.\r\n\r\n【JP Core仕様】本プロファイルでは、表示名として必須とする。\r\n\r\n多くの場合、coding.display と同一になるが、coding.display に異なる複数の表現が格納される場合を想定し、code間で共通の表現として必須とする。"
* subject 1..
* subject only Reference(JP_Patient)
* subject ^definition = "The patient, or group of patients, location, or device this observation is about and into whose record the observation is placed. If the actual focus of the observation is different from the subject (or a sample of, part, or region of the subject), the `focus` element or the `code` itself specifies the actual focus of the observation.\r\n\r\n検体検査の対象となる患者。"
* subject ^comment = "One would expect this element to be a cardinality of 1..1. The only circumstance in which the subject can be missing is when the observation is made by a device that does not know the patient. In this case, the observation SHALL be matched to a patient through some context/channel matching technique, and at this point, the observation should be updated.\r\n【JP Core仕様】本プロファイルでは、Patient 限定、かつ必須とする。"
* focus ^definition = "The actual focus of an observation when it is not the patient of record representing something or someone associated with the patient such as a spouse, parent, fetus, or donor. For example, fetus observations in a mother's record.  The focus of an observation could also be an existing condition,  an intervention, the subject's diet,  another observation of the subject,  or a body structure such as tumor or implanted device.   An example use case would be using the Observation resource to capture whether the mother is trained to change her child's tracheostomy tube. In this example, the child is the patient of record and the mother is the focus.\r\n\r\n患者当人ではなく、患者の胎児、親、ドナーなどの検査、観察の場合、その対象を示す。"
* focus ^comment = "Typically, an observation is made about the subject - a patient, or group of patients, location, or device - and the distinction between the subject and what is directly measured for an observation is specified in the observation code itself ( e.g., \"Blood Glucose\") and does not need to be represented separately using this element.  Use `specimen` if a reference to a specimen is required.  If a code is required instead of a resource use either  `bodysite` for bodysites or the standard extension [focusCode](extension-observation-focuscode.html).\r\n【JP Core仕様】当面は未使用とする。"
* encounter ^definition = "The healthcare event  (e.g. a patient and healthcare provider interaction) during which this observation is made.\r\n\r\nこの検査が行われるヘルスケアイベント。医療提供者と患者の接点。"
* encounter ^comment = "This will typically be the encounter the event occurred within, but some events may be initiated prior to or after the official completion of an encounter but still be tied to the context of the encounter (e.g. pre-admission laboratory tests).\r\n\r\n【JP Core仕様】入院外来の区別や所在場所、担当診療科の情報に使用する。\r\n\r\n※本プロファイルの用途では通常は必須と考えられるが、ユースケースにより使用されない場合を考慮し、1..1に制約しない。"
* effective[x] 1..
* effective[x] only dateTime or Period or Timing
* effective[x] ^definition = "The time or time-period the observed value is asserted as being true. For biological subjects - e.g. human patients - this is usually called the \"physiologically relevant time\". This is usually either the time of the procedure or of specimen collection, but very often the source of the date/time is not known, only the date/time itself.\r\n\r\n検体検査の場合は、検体採取日時。"
* effective[x] ^comment = "At least a date should be present unless this observation is a historical report.  For recording imprecise or \"fuzzy\" times (For example, a blood glucose measurement taken \"after breakfast\") use the [Timing](datatypes.html#timing) datatype which allow the measurement to be tied to regular life events.\r\n\r\n【JP Core仕様】本プロファイルでは、検体採取日時を設定し、必須とする。\r\n\r\neffectiveInstant\r\n\r\ninstant型はイベント発生のログ時間であり、未使用とする。"
* issued ^definition = "The date and time this version of the observation was made available to providers, typically after the results have been reviewed and verified.\r\n\r\nこの情報の発生日時。システム時刻であり、人が報告する時刻ではないことに注意。このリソースの発生時間と同じになる場合がある。"
* issued ^comment = "For Observations that don’t require review and verification, it may be the same as the [`lastUpdated` ](resource-definitions.html#Meta.lastUpdated) time of the resource itself.  For Observations that do require review and verification for certain updates, it might not be the same as the `lastUpdated` time of the resource itself due to a non-clinically significant update that doesn’t require the new version to be reviewed and verified again.\r\n\r\n【JP Core仕様】検査結果が**システムにより**Observationリソースに格納または更新された日時。"
* performer ^definition = "Who was responsible for asserting the observed value as \"true\".\r\n\r\n検査値を確認した責任者。検査実施責任者情報。"
* performer ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n【JP Core仕様】検査に直接責任を負う個人(つまり検査を実行、もしくは検証した人)の識別子。"
* value[x] only Quantity or CodeableConcept or string
* value[x] ^definition = "The information determined as a result of making the observation, if the information has a simple value.\r\n\r\n検体検査の結果として決定された情報。"
* value[x] ^comment = "An observation may have; 1)  a single value here, 2)  both a value and a set of related or component values,  or 3)  only a set of related or component values. If a value is present, the datatype for this element should be determined by Observation.code.  A CodeableConcept with just a text would be used instead of a string if the field was usually coded, or if the type associated with the Observation.code defines a coded value.  For additional guidance, see the [Notes section](observation.html#notes) below.\r\n\r\n【JP Core仕様】valueQuantity　：OBX-2＝「NM」の時の OBX-5(結果値)、OBX-6(単位)\r\n\r\nvalueQuantity.value　：OBX-5(結果値)\r\n\r\nvalueQuantity.comparator　：SS-MIX2 検体検査結果メッセージでは未使用となっているデータ型だが、SN型のSN.1(比較演算子)が該当する。検査値の「0未満」の場合の「未満」などに相当するコードを設定。\r\n\r\nvalueQuantity.unit　：OBX-6(単位) CWE.2 テキスト\r\n\r\nvalueQuantity.system　：OBX-6(単位) CWE.3 コード体系\r\nHL7では「ISO+」だが、ローカルコード99zzzのHL7標準の”ISO+\"が示すOID、ローカルコードの場合はOIDを別途取得必要？\r\n\r\nvalueQuantity.code　：OBX-6(単位) CWE.1 識別子\r\n\r\nvalueCodeableConcept　：OBX-2＝「CWE」の時の OBX-5(結果値)\r\n\r\nvalueCodeableConcept.coding　：SS-MIXの場合、CWEは正規コード＋代替コードの2種類登録可能。\r\n\r\nvalueCodeableConcept.coding.system　：CWE.3 or 6 コード体系。対象コードの OIDを設定\r\n\r\nvalueCodeableConcept.coding.version　：CWE.7 コード体系バージョン ID\r\n\r\nvalueCodeableConcept.coding.code　：CWE.1 or 4 識別子。対象コードシステムのコード\r\n\r\nvalueCodeableConcept.coding.display　：CWE.2 or 5 テキスト。対象コードの名称\r\n\r\nvalueCodeableConcept.coding.userselected　：未使用とする。\r\n\r\nvalueCodeableConcept.text　：CWE.2 テキスト。coding.display と同じ。\r\n\r\nvalueString　：OBX-2＝「ST」の時の OBX-5(結果値)\r\n\r\n以下のデータ型はSS-MIX2では未使用のため、未使用とした。今後の議論で使用の必要性が出れば復活させる。\r\n\r\nvalueBoolean\r\n\r\nvalueInteger　：OBX-2＝「NW」の時の OBX-5(結果値)\r\n\r\nvalueRange\r\n\r\nvalueRatio\r\n\r\nvalueSampledData\r\n\r\nvalueTime　：OBX-2＝「TM」の時の OBX-5(結果値)\r\n\r\nvalueDateTime　：OBX-2＝「DT」の時の OBX-5(結果値)\r\n\r\nvaluePeriod"
* dataAbsentReason ^definition = "Provides a reason why the expected value in the element Observation.value[x] is missing.\r\n\r\n検査結果値が欠落している理由。"
* dataAbsentReason ^comment = "Null or exceptional values can be represented two ways in FHIR Observations.  One way is to simply include them in the value set and represent the exceptions in the value.  For example, measurement values for a serology test could be  \"detected\", \"not detected\", \"inconclusive\", or  \"specimen unsatisfactory\".   \n\nThe alternate way is to use the value element for actual observations and use the explicit dataAbsentReason element to record exceptional values.  For example, the dataAbsentReason code \"error\" could be used when the measurement was not completed. Note that an observation may only be reported if there are values to report. For example differential cell counts values may be reported only when > 0.  Because of these options, use-case agreements are required to interpret general observations for null or exceptional values.\r\n\r\n【JP Core仕様】SS-MIX2で未使用だが、valueの欠落時に使用する必要があり、重要な項目である。\r\n\r\n制約「obs-6」に示す通り、valueが存在する場合、当該項目は存在してはならない。\r\n\r\ntextのみでの使用は基本的に不可とし、必ずcodingを設定すること。\r\n\r\n(unknown |   asked-unknown |   temp-unknown |   not-asked |   asked-declined | masked | not-applicable | unsupported | as-text | error |   not-a-number |   negative-infinity |   positive-infinity | not-performed | not-permitted)"
* interpretation ^short = "High, low, normal, etc. 高、低、正常、など。"
* interpretation ^definition = "A categorical assessment of an observation value.  For example, high, low, normal.\r\n\r\n検査結果値の、（高、低、正常）といったカテゴリー評価。結果報告書に記載されることもある情報。"
* interpretation ^comment = "Historically used for laboratory results (known as 'abnormal flag' ),  its use extends to other use cases where coded interpretations  are relevant.  Often reported as one or more simple compact codes this element is often placed adjacent to the result value in reports and flow sheets to signal the meaning/normalcy status of the result.\r\n\r\n【JP Core仕様】拡張可コード表「ObservationInterpretationCodes」を使用する。\r\n\r\nコード表が大きいため、下記参照。\r\n\r\nhttps://www.hl7.org/fhir/R4/valueset-observation-interpretation.html"
* interpretation ^requirements = "For some results, particularly numeric results, an interpretation is necessary to fully understand the significance of a result.\r\n\r\n特に数値結果については、結果の重要性を完全に理解するために解釈を必要とする場合がある。"
* note ^definition = "Comments about the observation or the results.\r\n\r\n検査、あるいは結果に関するコメント。フリーテキストの追加情報として使用可能。"
* note ^comment = "May include general statements about the observation, or statements about significant, unexpected or unreliable results values, or information about its source when relevant to its interpretation."
* note.author[x] ^comment = "Organization is used when there's no need for specific attribution as to who made the comment."
* note.time ^comment = ""
* note.text ^comment = "Systems are not required to have markdown support, so the text should be readable without markdown processing. The markdown syntax is GFM - see https://github.github.com/gfm/"
* bodySite ^definition = "Indicates the site on the subject's body where the observation was made (i.e. the target site).\r\n\r\n検査が行われた患者の体の部位。検体検査に関しては、当面は使用しない。"
* bodySite ^comment = "Only used if not implicit in code found in Observation.code.  In many systems, this may be represented as a related observation instead of an inline component.   \n\nIf the use case requires BodySite to be handled as a separate resource (e.g. to identify and track separately) then use the standard extension[ bodySite](extension-bodysite.html).\r\n\r\n【JP Core仕様】当面は未使用とする。"
* method ^short = "How it was done 実施の方法"
* method ^definition = "Indicates the mechanism used to perform the observation.\r\n\r\n検体検査の検査方法、測定方法。"
* method ^comment = "Only used if not implicit in code for Observation.code.\r\n\r\nObservation.code の code から測定方法が暗黙的でない場合にのみ使用する。\r\n\r\n【JP Core仕様】Observation.code に JLAC10コードを使用する場合、測定方法コードが含まれているため method は使用しない。Observation.code から測定方法が判明しない場合や、実際の測定方法が異なる場合に使用することになるが、現状では運用が困難と想定されるため、当面は未使用とする。"
* method ^requirements = "In some cases, method can impact results and is thus used for determining whether results can be compared or determining significance of results.\r\n\r\n場合により、測定方法は結果に影響を与える可能性があるため、結果を比較できるかどうかを判断したり、結果の重要性を判断したりするために使用される。"
* specimen 1..
* specimen ^definition = "The specimen that was used when this observation was made.\r\n\r\nこの検査に使用された検体（標本）。"
* specimen ^comment = "Should only be used if not implicit in code found in `Observation.code`.  Observations are not made on specimens themselves; they are made on a subject, but in many cases by the means of a specimen. Note that although specimens are often involved, they are not always tracked and reported explicitly. Also note that observation resources may be used in contexts that track the specimen explicitly (e.g. Diagnostic Report).\r\n\r\n【JP Core仕様】検体検査プロファイルでは必須とする。"
* device ^definition = "The device used to generate the observation data.\r\n\r\n検査装置、機器。"
* device ^comment = "Note that this is not meant to represent a device involved in the transmission of the result, e.g., a gateway.  Such devices may be documented using the Provenance resource where relevant.\r\n\r\n【JP Core仕様】検査に使用した機器等の情報に使用する。"
* referenceRange ^definition = "Guidance on how to interpret the value by comparison to a normal or recommended range.  Multiple reference ranges are interpreted as an \"OR\".   In other words, to represent two distinct target populations, two `referenceRange` elements would be used.\r\n\r\n推奨範囲として結果値を解釈するためのガイダンス。基準値。"
* referenceRange ^comment = "Most observations only have one generic reference range. Systems MAY choose to restrict to only supplying the relevant reference range based on knowledge about the patient (e.g., specific to the patient's age, gender, weight and other factors), but this might not be possible or appropriate. Whenever more than one reference range is supplied, the differences between them SHOULD be provided in the reference range and/or age properties.\r\n\r\n【JP Core仕様】可能な限りlow、highに構造化すべき。構造化できない場合、あるいはlow、highに該当しない場合はtextを使用。"
* referenceRange.low ^comment = "The context of use may frequently define what kind of quantity this is and therefore what kind of units can be used. The context of use may also restrict the values for the comparator."
* referenceRange.high ^comment = "The context of use may frequently define what kind of quantity this is and therefore what kind of units can be used. The context of use may also restrict the values for the comparator."
* referenceRange.type ^definition = "Codes to indicate the what part of the targeted reference population it applies to. For example, the normal or therapeutic range.\r\n\r\n対象となる母集団のどの部分に適用するかを示すコード。正常範囲、要治療範囲、など。"
* referenceRange.type ^comment = "This SHOULD be populated if there is more than one range.  If this element is not present then the normal range is assumed."
* referenceRange.appliesTo ^definition = "Codes to indicate the target population this reference range applies to.  For example, a reference range may be based on the normal population or a particular sex or race.  Multiple `appliesTo`  are interpreted as an \"AND\" of the target populations.  For example, to represent a target population of African American females, both a code of female and a code for African American would be used.\r\n\r\n基準値が適用される母集団を示すコード。人種、性別など。"
* referenceRange.appliesTo ^comment = "This SHOULD be populated if there is more than one range.  If this element is not present then the normal population is assumed."
* referenceRange.age ^definition = "The age at which this reference range is applicable. This is a neonatal age (e.g. number of weeks at term) if the meaning says so.\r\n\r\n基準値が適用される年齢。新生児の場合、週数もありうる。"
* referenceRange.age ^comment = "The stated low and high value are assumed to have arbitrarily high precision when it comes to determining which values are in the range. I.e. 1.99 is not in the range 2 -> 3."
* referenceRange.text ^definition = "Text based reference range in an observation which may be used when a quantitative range is not appropriate for an observation.  An example would be a reference value of \"Negative\" or a list or table of \"normals\".\r\n\r\n量的範囲で表せない場合などに使用する。"
* referenceRange.text ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size"
* hasMember ^definition = "This observation is a group observation (e.g. a battery, a panel of tests, a set of vital sign measurements) that includes the target as a member of the group.\r\n\r\nこの検査が含まれるグループを示す。"
* hasMember ^comment = "When using this element, an observation will typically have either a value or a set of related resources, although both may be present in some cases.  For a discussion on the ways Observations can assembled in groups together, see [Notes](observation.html#obsgrouping) below.  Note that a system may calculate results from [QuestionnaireResponse](questionnaireresponse.html)  into a final score and represent the score as an Observation.\r\n\r\n【JP Core仕様】1検査で複数の検査項目が実施される場合の親検査項目を設定する。"
* derivedFrom ^definition = "The target resource that represents a measurement from which this observation value is derived. For example, a calculated anion gap or a fetal measurement based on an ultrasound image.\r\n\r\nこの検査値の発生元である関連リソース。例えば他のObservation を受けて、本検査値が発生した場合など。"
* derivedFrom ^comment = "All the reference choices that are listed in this element can represent clinical observations and other measurements that may be the source for a derived value.  The most common reference will be another Observation.  For a discussion on the ways Observations can assembled in groups together, see [Notes](observation.html#obsgrouping) below."
* component ^definition = "Some observations have multiple component observations.  These component observations are expressed as separate code value pairs that share the same attributes.  Examples include systolic and diastolic component observations for blood pressure measurement and multiple component observations for genetics observations.\r\n\r\n一度のタイミングでの1回の検査で複数の結果を同時に得る場合にのみ使用される。例えば、血圧の収縮期、拡張期。新生児のApgarスコア。質問に対する複数の回答（飲んだアルコールの種類、など）。"
* component ^comment = "For a discussion on the ways Observations can be assembled in groups together see [Notes](observation.html#notes) below."
* component.code ^comment = "*All* code-value and  component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation."
* component.value[x] ^comment = "Used when observation has a set of component observations. An observation may have both a value (e.g. an  Apgar score)  and component observations (the observations from which the Apgar score was derived). If a value is present, the datatype for this element should be determined by Observation.code. A CodeableConcept with just a text would be used instead of a string if the field was usually coded, or if the type associated with the Observation.code defines a coded value.  For additional guidance, see the [Notes section](observation.html#notes) below."
* component.interpretation ^comment = "Historically used for laboratory results (known as 'abnormal flag' ),  its use extends to other use cases where coded interpretations  are relevant.  Often reported as one or more simple compact codes this element is often placed adjacent to the result value in reports and flow sheets to signal the meaning/normalcy status of the result."
* component.referenceRange ^comment = "Most observations only have one generic reference range. Systems MAY choose to restrict to only supplying the relevant reference range based on knowledge about the patient (e.g., specific to the patient's age, gender, weight and other factors), but this might not be possible or appropriate. Whenever more than one reference range is supplied, the differences between them SHOULD be provided in the reference range and/or age properties."