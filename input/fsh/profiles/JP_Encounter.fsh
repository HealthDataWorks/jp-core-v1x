// ==============================
//   Profile 定義
// ==============================
Profile: JP_Encounter
Parent: Encounter
Id: jp-encounter
Description: "このプロファイルはEncounterリソースに対して、来院/入院情報のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Encounter"
* ^status = #draft
* ^date = "2022-03-16"
* . ^short = "An interaction during which services are provided to the patient / 患者さんにサービスが提供されている間の相互作用"
* . ^definition = "An interaction between a patient and healthcare provider(s) for the purpose of providing healthcare service(s) or assessing the health status of a patient.\r\n\r\n医療サービスの提供または患者の健康状態の評価を目的とした、患者と医療提供者との間の相互作用。エンカウンターと表現される。\r\n\r\n【JP-CORE】\r\n外来受診、救急受診、入院、退院、対面診察、電話診察、など。"
* identifier ^short = "Identifier(s) by which this encounter is known / このEncounterが知られている識別子（複数可）"
* identifier ^definition = "Identifier(s) by which this encounter is known.\r\n\r\nこのEncounterが知られている識別子（複数可）。"
* status ^short = "planned | arrived | triaged | in-progress | onleave | finished | cancelled + / 予定｜到着｜トリアージ｜進行中｜保留中｜終了｜キャンセル+"
* status ^definition = "planned | arrived | triaged | in-progress | onleave | finished | cancelled +.\r\n\r\n予定｜到着｜トリアージ｜進行中｜保留中｜終了｜キャンセル+."
* status ^comment = "Note that internal business rules will determine the appropriate transitions that may occur between statuses (and also classes).\r\n\r\n内部のビジネス・ルールは、ステータス(およびクラス)間で発生する可能性のある適切な遷移を検出することに注意してください。"
* status ^isModifierReason = "This element is labeled as a modifier because it is a status element that contains status entered-in-error which means that the resource should not be treated as valid / この要素は、リソースを有効なものとして扱うべきではないことを意味する status entered-in-error を含む status 要素であるため、修飾子としてラベル付けされています。"
* statusHistory ^short = "List of past encounter statuses / 過去のEncouterのステータス一覧"
* statusHistory ^definition = "The status history permits the encounter resource to contain the status history without needing to read through the historical versions of the resource, or even have the server store them.\r\n\r\nステータス履歴(status History)は、リソースの歴史的なバージョンを読み込んだり、サーバーに保存させたりすることなく、Encouterリソースがステータス履歴を含むことを可能にします。"
* statusHistory ^comment = "The current status is always found in the current version of the resource, not the status history.\r\n\r\n現在のステータスは、ステータスの履歴ではなく、常にリソースの現在のバージョンにあります。"
* statusHistory.status ^short = "planned | arrived | triaged | in-progress | onleave | finished | cancelled + / 予定｜到着｜トリアージ｜進行中｜保留中｜終了｜キャンセル+."
* statusHistory.status ^definition = "planned | arrived | triaged | in-progress | onleave | finished | cancelled +.\r\n\r\n\r\n予定｜到着｜トリアージ｜進行中｜保留中｜終了｜キャンセル+."
* statusHistory.status ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size\r\n\r\n\r\nFHIR 文字列のサイズは 1MB を超えてはならないことに注意してください。"
* statusHistory.period ^short = "The time that the episode was in the specified status / そのエピソードが指定された状態になっていた時間。"
* statusHistory.period ^definition = "The time that the episode was in the specified status.\r\n\r\n\r\nそのエピソードが指定された状態になっていた時間。"
* statusHistory.period ^comment = "A Period specifies a range of time; the context of use will specify whether the entire range applies (e.g. \"the patient was an inpatient of the hospital for this time range\") or one value from the range applies (e.g. \"give to the patient between these two times\").\n\nPeriod is not used for a duration (a measure of elapsed time). See [Duration](datatypes.html#Duration).\r\n\r\n\r\nこれは期間ではありません-これは時間の尺度（別のタイプ）ですが、時間の固定値で発生する期間です。 期間は時間の範囲を指定します。 使用状況は、範囲全体が適用されるか（たとえば、「患者はこの時間範囲で入院していた」）、または範囲から1つの値が適用されるか（たとえば、「これら2回の間に患者に与える」）を指定します。 期間が必要な場合は、タイプをInterval | Durationとして指定します。"
* class ^short = "Classification of patient encounter / 患者とのEncouterの分類"
* class ^definition = "Concepts representing classification of patient encounter such as ambulatory (outpatient), inpatient, emergency, home health or others due to local variations.\r\n\r\n外来（外来）、入院、救急、在宅医療、その他の地域差による患者Encouterの分類を表す概念。"
* class ^comment = "Codes may be defined very casually in enumerations or code lists, up to very formal definitions such as SNOMED CT - see the HL7 v3 Core Principles for more information.\r\n\r\nコードは列挙やコードリストの中で非常にカジュアルに定義されることもあれば、SNOMED CTのような非常にフォーマルな定義まであります - 詳細はHL7 v3コア・プリンシプルを参照してください。"
* classHistory ^short = "List of past encounter classes / 過去のEncouter classのリスト"
* classHistory ^definition = "The class history permits the tracking of the encounters transitions without needing to go  through the resource history.  This would be used for a case where an admission starts of as an emergency encounter, then transitions into an inpatient scenario. Doing this and not restarting a new encounter ensures that any lab/diagnostic results can more easily follow the patient and not require re-processing and not get lost or cancelled during a kind of discharge from emergency to inpatient.\r\n\r\nクラスの履歴は、リソースの履歴を経由することなく、Encouterの遷移を追跡することを可能にします。これは、入院患者が緊急時にEncouterした後、入院患者のシナリオに移行する場合に使用されます。このようにして、新しいEncouterを再開しないようにすることで、検査/診断結果がより簡単に患者を追跡することができ、再処理を必要とせず、救急から入院への退院の際に紛失したりキャンセルされたりすることがないことを保証します。"
* classHistory.class ^short = "inpatient | outpatient | ambulatory | emergency + / 入院｜外来｜外来｜救急＋"
* classHistory.class ^definition = "inpatient | outpatient | ambulatory | emergency +.\r\n\r\n\r\n入院｜外来｜外来｜救急＋。"
* classHistory.class ^comment = "Codes may be defined very casually in enumerations or code lists, up to very formal definitions such as SNOMED CT - see the HL7 v3 Core Principles for more information.\r\n\r\n\r\nコードは列挙やコードリストの中で非常にカジュアルに定義されることもあれば、SNOMED CTのような非常にフォーマルな定義まであります - 詳細はHL7 v3コア・プリンシプルを参照してください。"
* classHistory.period ^short = "The time that the episode was in the specified class / 指定されたクラスにエピソードがあった時間"
* classHistory.period ^definition = "The time that the episode was in the specified class.\r\n\r\n\r\n指定されたクラスにエピソードがあった時間。"
* classHistory.period ^comment = "A Period specifies a range of time; the context of use will specify whether the entire range applies (e.g. \"the patient was an inpatient of the hospital for this time range\") or one value from the range applies (e.g. \"give to the patient between these two times\").\n\nPeriod is not used for a duration (a measure of elapsed time). See [Duration](datatypes.html#Duration).\r\n\r\n\r\nこれは期間ではありません-これは時間の尺度（別のタイプ）ですが、時間の固定値で発生する期間です。 期間は時間の範囲を指定します。 使用状況は、範囲全体が適用されるか（たとえば、「患者はこの時間範囲で入院していた」）、または範囲から1つの値が適用されるか（たとえば、「これら2回の間に患者に与える」）を指定します。 期間が必要な場合は、タイプをInterval | Durationとして指定します。"
* type ^short = "Specific type of encounter / Encouterの具体的なタイプ"
* type ^definition = "Specific type of encounter (e.g. e-mail consultation, surgical day-care, skilled nursing, rehabilitation).\r\n\r\n具体的なEncouterの種類（メール相談、外科デイケア、熟練看護、リハビリテーションなど）"
* type ^comment = "Since there are many ways to further classify encounters, this element is 0..*.\r\n\r\nEncouterをさらに分類する方法はいろいろあるので、この要素は0...*です。"
* serviceType ^short = "Specific type of service / 具体的なサービスの種類"
* serviceType ^definition = "Broad categorization of the service that is to be provided (e.g. cardiology).\r\n\r\n提供されるサービスの大まかな分類（心臓病など）。"
* serviceType ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\nすべてのターミノロジーの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素間の関係とpre-coordinationとpost-coordinationの用語関係を管理するための独自の構造を提供する必要がある。"
* priority ^short = "Indicates the urgency of the encounter / このEncounterの緊急性を示します"
* priority ^definition = "Indicates the urgency of the encounter.\r\n\r\nこのEncounterの緊急性を示します。"
* priority ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\nすべてのターミノロジーの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素間の関係とpre-coordinationとpost-coordinationの用語関係を管理するための独自の構造を提供する必要がある。"
* subject ^short = "The patient or group present at the encounter / このEncounterに立ち会う患者またはグループ"
* subject ^definition = "The patient or group present at the encounter.\r\n\r\nこのEncounterに立ち会う患者またはグループ。"
* subject ^comment = "While the encounter is always about the patient, the patient might not actually be known in all contexts of use, and there may be a group of patients that could be anonymous (such as in a group therapy for Alcoholics Anonymous - where the recording of the encounter could be used for billing on the number of people/staff and not important to the context of the specific patients) or alternately in veterinary care a herd of sheep receiving treatment (where the animals are not individually tracked).\r\n\r\nこのEncounterは常に患者に関するものであるが、患者は実際にはすべての使用状況で知られているわけではなく、匿名である可能性のある患者のグループが存在する可能性がある。（匿名のアルコール依存症の集団療法など-遭遇は、人数/スタッフの請求に使用でき、特定の患者の状況には重要ではない）"
* episodeOfCare ^short = "Episode(s) of care that this encounter should be recorded against / このEncounterが記録されるべきケアのエピソード"
* episodeOfCare ^definition = "Where a specific encounter should be classified as a part of a specific episode(s) of care this field should be used. This association can facilitate grouping of related encounters together for a specific purpose, such as government reporting, issue tracking, association via a common problem.  The association is recorded on the encounter as these are typically created after the episode of care and grouped on entry rather than editing the episode of care to append another encounter to it (the episode of care could span years).\r\n\r\n特定のEncounterをケアの特定のエピソードの一部として分類する必要がある場合は、このフィールドを使用する必要があります。この関連付けにより、政府の報告、問題追跡、一般的な問題を介した関連付けなど、特定の目的のために関連するエンカウンターをグループ化することが容易になります。これらは通常、ケアのエピソードの後に​​作成され、ケアのエピソードを編集して別のエンカウンターを追加するのではなく、エントリ時にグループ化されるため、関連付けはエンカウンターに記録されます（ケアのエピソードは数年にわたる場合があります）。"
* episodeOfCare ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* basedOn ^short = "The ServiceRequest that initiated this encounter / このEncounterを開始したServiceRequest"
* basedOn ^definition = "The request this encounter satisfies (e.g. incoming referral or procedure request).\r\n\r\nこのEncounterが満たすリクエスト（例：入ってくる紹介または手続きリクエスト）。"
* basedOn ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* participant ^short = "List of participants involved in the encounter / このEncounterに関わった参加者一覧"
* participant ^definition = "The list of people responsible for providing the service.\r\n\r\nサービスを提供する責任がある人々のリスト。"
* participant.type ^short = "Role of participant in encounter / このエンカウンターにおける参加者の役割"
* participant.type ^definition = "Role of participant in encounter.\r\n\r\n\r\nこのエンカウンターにおける参加者の役割。"
* participant.type ^comment = "The participant type indicates how an individual participates in an encounter. It includes non-practitioner participants, and for practitioners this is to describe the action type in the context of this encounter (e.g. Admitting Dr, Attending Dr, Translator, Consulting Dr). This is different to the practitioner roles which are functional roles, derived from terms of employment, education, licensing, etc.\r\n\r\n\r\n参加者タイプは、個人がEncounterにどのように参加するかを示します。これには、開業医以外の参加者が含まれます。開業医の場合、これは、このEncounterのコンテキストでのアクションタイプを説明することです（例：入院医師、出席医師、翻訳者、コンサルティング医師）。これは、雇用、教育、ライセンスなどの条件から派生した機能的な役割である開業医の役割とは異なります。"
* participant.period ^short = "Period of time during the encounter that the participant participated / この参加者が参加したEncounterの中での期間"
* participant.period ^definition = "The period of time that the specified participant participated in the encounter. These can overlap or be sub-sets of the overall encounter's period.\r\n\r\n\r\n指定された参加者がEncounterに参加した期間。これらは重複することも、Encounter全体の期間のサブセットになることもあります。"
* participant.individual ^short = "Persons involved in the encounter other than the patient / 患者以外のこのEncounterに関わった人"
* participant.individual ^definition = "Persons involved in the encounter other than the patient.\r\n\r\n\r\n患者以外のこのEncounterに関わった人。"
* appointment ^short = "The appointment that scheduled this encounter / このEncounterをスケジュールした予定"
* appointment ^definition = "The appointment that scheduled this encounter.\r\n\r\nこのEncounterをスケジュールした予定。"
* appointment ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* period ^short = "The start and end time of the encounter / このEncounterの開始時間と終了時間"
* period ^definition = "The start and end time of the encounter.\r\n\r\nこのEncounterの開始時間と終了時間。"
* period ^comment = "If not (yet) known, the end of the Period may be omitted.\r\n\r\n（まだ）わからない場合は、期間の終了を省略できる。"
* length ^short = "Quantity of time the encounter lasted (less time absent) / Encounterが続いた時間の量（欠席時間が少ない）"
* length ^definition = "Quantity of time the encounter lasted. This excludes the time during leaves of absence.\r\n\r\nこのエンカウンターが続いた時間。これは休職中の時間を除外します。"
* length ^comment = "May differ from the time the Encounter.period lasted because of leave of absence.\r\n\r\n休職のため、Encounter.periodが続いた時間とは異なる場合がある。"
* reasonCode ^short = "Coded reason the encounter takes place / Encounterの発生をコード化された理由の情報"
* reasonCode ^definition = "Reason the encounter takes place, expressed as a code. For admissions, this can be used for a coded admission diagnosis.\r\n\r\n受診理由をコードで表現したもの。入院の場合はコード化された入院診断名に使用することができる。"
* reasonCode ^comment = "For systems that need to know which was the primary diagnosis, these will be marked with the standard extension primaryDiagnosis (which is a sequence value rather than a flag, 1 = primary diagnosis).\r\n\r\nどれが主たる診断であったかを知る必要があるシステムでは、これらは標準のエクステンションであるprimaryDiagnosis（フラグではなくシーケンス値、1 = 主たる診断）でマークされる。"
* reasonReference ^short = "Reason the encounter takes place (reference)　エンカウンターがあった理由"
* reasonReference ^definition = "Reason the encounter takes place, expressed as a code. For admissions, this can be used for a coded admission diagnosis.\r\n\r\nコードとして表現されたエンカウンターが起こった理由。入院の場合、これはコード化されたコード化された入院時診断に使用できます。"
* reasonReference ^comment = "For systems that need to know which was the primary diagnosis, these will be marked with the standard extension primaryDiagnosis (which is a sequence value rather than a flag, 1 = primary diagnosis).\r\n\r\nどれが主たる診断であったかを知る必要があるシステムでは、これらは標準のエクステンションであるprimaryDiagnosis（フラグではなくシーケンス値、1 = 主たる診断）でマークされる。"
* diagnosis ^short = "The list of diagnosis relevant to this encounter / このEncounterに関連する診断名のリスト"
* diagnosis ^definition = "The list of diagnosis relevant to this encounter.\r\n\r\nこのEncounterに関連する診断名のリスト"
* diagnosis.condition ^short = "The diagnosis or procedure relevant to the encounter / Encounterに関連する診断または処置"
* diagnosis.condition ^definition = "Reason the encounter takes place, as specified using information from another resource. For admissions, this is the admission diagnosis. The indication will typically be a Condition (with other resources referenced in the evidence.detail), or a Procedure.\r\n\r\n\r\n受診理由（他のリソースからの情報を使用して指定されたもの）。入院の場合、これは入院診断名である。表現方法は通常、状態（evidence.detailで参照されている他のリソースを使用）、または処置である。"
* diagnosis.condition ^comment = "For systems that need to know which was the primary diagnosis, these will be marked with the standard extension primaryDiagnosis (which is a sequence value rather than a flag, 1 = primary diagnosis).\r\n\r\n\r\nどちらが一次診断であったかを知る必要があるシステムでは、これらは標準のエクステンションであるprimaryDiagnosis（フラグではなくシーケンス値、1 = 一次診断）でマークされます。"
* diagnosis.use ^short = "Role that this diagnosis has within the encounter (e.g. admission, billing, discharge …) / この診断名がある受診機会において持っている役割（例えば、入院、請求、退院...）"
* diagnosis.use ^definition = "Role that this diagnosis has within the encounter (e.g. admission, billing, discharge …).\r\n\r\n\r\nこの診断名がある受診機会において持っている役割（例えば、入院、請求、退院...）。"
* diagnosis.rank ^short = "Ranking of the diagnosis (for each role type) / 診断名の順位（役割別）"
* diagnosis.rank ^definition = "Ranking of the diagnosis (for each role type).\r\n\r\n\r\n診断名の順位（役割別）"
* account ^short = "The set of accounts that may be used for billing for this Encounter / あるEncounterの請求に使用される会計セット"
* account ^definition = "The set of accounts that may be used for billing for this Encounter.\r\n\r\nあるEncounterの請求に使用される会計セット。"
* account ^comment = "The billing system may choose to allocate billable items associated with the Encounter to different referenced Accounts based on internal business rules.\r\n\r\n請求システムは、内部ルールに基づいて、ある受診機会に関連付けられた請求可能な項目を異なる参照先の会計に割り当てることができる。"
* hospitalization ^short = "Details about the admission to a healthcare service/医療機関への入院に関する詳細"
* hospitalization ^definition = "Details about the admission to a healthcare service.\r\n\r\n医療機関への入院に関する詳細"
* hospitalization ^comment = "An Encounter may cover more than just the inpatient stay. Contexts such as outpatients, community clinics, and aged care facilities are also included.\r\rThe duration recorded in the period of this encounter covers the entire scope of this hospitalization record.\r\n\r\nEncounterは、入院患者の滞在の記録だけではない。外来患者、地域の診療所、高齢者施設などのコンテクストも含まれます。\r\nこのEncouterの期間に記録された時間区間は、この入院記録の全範囲をカバーしている。"
* hospitalization.preAdmissionIdentifier ^short = "Pre-admission identifier/入院前識別子"
* hospitalization.preAdmissionIdentifier ^definition = "Pre-admission identifier.\r\n\r\n\r\n入院前識別子"
* hospitalization.origin ^short = "The location/organization from which the patient came before admission/患者が入院する前に来院した場所/組織"
* hospitalization.origin ^definition = "The location/organization from which the patient came before admission.\r\n\r\n\r\n患者が入院する前に来院した場所/組織"
* hospitalization.origin ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n\r\n参照は実際のFHIRリソースへの参照でなければならず、解決可能でなければなりません。解決は URL からの検索、またはリソースタイプによって、絶対参照を正規の URL として扱い、ローカルのレジストリ/リポジトリで検索することで行うことができます。"
* hospitalization.admitSource ^short = "From where patient was admitted (physician referral, transfer)/患者がどこから入院したか（医師の紹介、転院）"
* hospitalization.admitSource ^definition = "From where patient was admitted (physician referral, transfer).\r\n\r\n\r\n患者がどこから入院したか（医師の紹介、転院）\r\n例：他の病院からの転院、かかりつけ医からの紹介、この病院で産まれた、など"
* hospitalization.admitSource ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\n\r\nすべての用語の使用がこの一般的なパターンに適合するわけではない。いくつかのケースでは、モデルはCodeableConceptを使用せず、Codingを直接使用し、テキスト、コーディング、翻訳、要素間の関係、および前後の調整を管理するための独自の構造を提供することが望ましい。"
* hospitalization.reAdmission ^short = "The type of hospital re-admission that has occurred (if any). If the value is absent, then this is not identified as a readmission / 発生した病院の再入院のタイプ（もしあれば）。値がない場合、これは再入院として識別されません。"
* hospitalization.reAdmission ^definition = "Whether this hospitalization is a readmission and why if known.\r\n\r\n\r\nこの入院が再入院であるかどうかと、わかっている場合はその理由。"
* hospitalization.reAdmission ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\n\r\nすべての用語の使用がこの一般的なパターンに適合するわけではない。いくつかのケースでは、モデルはCodeableConceptを使用せず、Codingを直接使用し、テキスト、コーディング、翻訳、要素間の関係、および前後の調整を管理するための独自の構造を提供することが望ましい。"
* hospitalization.dietPreference ^short = "Diet preferences reported by the patient / 患者から報告された食事の好み"
* hospitalization.dietPreference ^definition = "Diet preferences reported by the patient.\r\n\r\n\r\n患者から報告された食事の好み"
* hospitalization.dietPreference ^comment = "For example, a patient may request both a dairy-free and nut-free diet preference (not mutually exclusive).\r\n\r\n\r\n例えば、患者は、乳製品を含まない食事とナッツ類を含まない食事の両方を希望することができます（相互に排他的ではありません）。"
* hospitalization.dietPreference ^requirements = "Used to track patient's diet restrictions and/or preference. For a complete description of the nutrition needs of a patient during their stay, one should use the nutritionOrder resource which links to Encounter.\r\n\r\n\r\n患者の食事制限および／または好み・嗜好を追跡するために使用される。滞在中の患者の栄養ニーズの完全な説明については、EncounterにリンクしているnutritionOrderリソースを使用する必要があります。"
* hospitalization.specialCourtesy ^short = "Special courtesies (VIP, board member) / 特別待遇(VIP、役員)"
* hospitalization.specialCourtesy ^definition = "Special courtesies (VIP, board member).\r\n\r\n\r\n特別待遇(VIP、役員)"
* hospitalization.specialCourtesy ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\n\r\nすべての用語の使用がこの一般的なパターンに適合するわけではない。いくつかのケースでは、モデルはCodeableConceptを使用せず、Codingを直接使用し、テキスト、コーディング、翻訳、要素間の関係、および前後の調整を管理するための独自の構造を提供することが望ましい。"
* hospitalization.specialArrangement ^short = "Wheelchair, translator, stretcher, etc. / 車椅子、トランスレーター、ストレッチャーなど"
* hospitalization.specialArrangement ^definition = "Any special requests that have been made for this hospitalization encounter, such as the provision of specific equipment or other things.\r\n\r\n\r\n特定の器具の提供など、今回の入院の出会いのために特別な要望があったもの"
* hospitalization.specialArrangement ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\n\r\nすべての用語の使用がこの一般的なパターンに適合するわけではない。いくつかのケースでは、モデルはCodeableConceptを使用せず、Codingを直接使用し、テキスト、コーディング、翻訳、要素間の関係、および前後の調整を管理するための独自の構造を提供することが望ましい。"
* hospitalization.destination ^short = "Location/organization to which the patient is discharged / 患者さんが退院する場所・機関"
* hospitalization.destination ^definition = "Location/organization to which the patient is discharged.\r\n\r\n\r\n患者さんが退院する場所・機関"
* hospitalization.destination ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n\r\n参照は実際のFHIRリソースへの参照でなければならず、解決可能でなければなりません。解決は URL からの検索、またはリソースタイプによって、絶対参照を正規の URL として扱い、ローカルのレジストリ/リポジトリで検索することで行うことができます。"
* hospitalization.dischargeDisposition ^short = "Category or kind of location after discharge / 退院後の場所の区分や種類。"
* hospitalization.dischargeDisposition ^definition = "Category or kind of location after discharge.\r\n\r\n\r\n退院後の場所の区分や種類。"
* hospitalization.dischargeDisposition ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\n\r\nすべての用語の使用がこの一般的なパターンに適合するわけではない。いくつかのケースでは、モデルはCodeableConceptを使用せず、Codingを直接使用し、テキスト、コーディング、翻訳、要素間の関係、および前後の調整を管理するための独自の構造を提供することが望ましい。"
* location ^short = "List of locations where the patient has been / 患者さんがいたことのある場所の一覧"
* location ^definition = "List of locations where  the patient has been during this encounter.\r\n\r\nこのEncounterの間に患者さんがいたことのある場所のリスト"
* location ^comment = "Virtual encounters can be recorded in the Encounter by specifying a location reference to a location of type \"kind\" such as \"client's home\" and an encounter.class = \"virtual\".\r\n\r\n仮想Encouterは、\"client's home \"のような \"kind \"型の場所を参照し、encounter.class = \"virtual \"を指定することで、Encounterに記録することができる。"
* location.location ^short = "Location the encounter takes place / Encounterの場所"
* location.location ^definition = "The location where the encounter takes place.\r\n\r\n\r\nEncounterの舞台となる場所。"
* location.location ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n\r\n参照は実際のFHIRリソースへの参照でなければならず、解決可能でなければなりません。解決は URL からの検索、またはリソースタイプによって、絶対参照を正規の URL として扱い、ローカルのレジストリ/リポジトリで検索することで行うことができます。"
* location.status ^definition = "The status of the participants' presence at the specified location during the period specified. If the participant is no longer at the location, then the period will have an end date/time.\r\n\r\n\r\n指定された期間中の指定された場所での参加者の存在状況。参加者がその場所にいなくなった場合、その期間は終了日時を持つ。"
* location.status ^comment = "When the patient is no longer active at a location, then the period end date is entered, and the status may be changed to completed.\r\n\r\n\r\n患者がその場所で活動しなくなった場合、期間終了日が入力され、ステータスが完了した状態に変更されることがあります"
* location.physicalType ^short = "The physical type of the location (usually the level in the location hierachy - bed room ward etc.) / 場所の物理的なタイプ（通常は場所の階層のレベル - ベッド・病室・病棟など）"
* location.physicalType ^definition = "This will be used to specify the required levels (bed/ward/room/etc.) desired to be recorded to simplify either messaging or query.\r\n\r\n\r\nこれは、メッセージングまたはクエリのいずれかを簡素化するために記録したい必要なレベル（ベッド/ワード/ルーム/その他）を指定するために使用されます。"
* location.physicalType ^comment = "This information is de-normalized from the Location resource to support the easier understanding of the encounter resource and processing in messaging or query.\n\nThere may be many levels in the hierachy, and this may only pic specific levels that are required for a specific usage scenario.\r\n\r\n\r\n\r\nこの情報は、メッセージングやクエリでのEncouterリソースの理解や処理を容易にするために、Locationリソースから非正規化されています。\r\n\r\n階層には多くのレベルがあり、これは特定の使用シナリオに必要とされる特定のレベルのみをピックすることができます。"
* location.period ^short = "Time period during which the patient was present at the location / 患者がその場所にいた期間"
* location.period ^definition = "Time period during which the patient was present at the location.\r\n\r\n\r\nその場所に患者がいた期間。"
* location.period ^comment = "A Period specifies a range of time; the context of use will specify whether the entire range applies (e.g. \"the patient was an inpatient of the hospital for this time range\") or one value from the range applies (e.g. \"give to the patient between these two times\").\n\nPeriod is not used for a duration (a measure of elapsed time). See [Duration](datatypes.html#Duration).\r\n\r\n\r\n期間は時間の範囲を指定します; 使用のコンテキストは、範囲全体が適用されるかどうかを指定します (例: \"患者はこの時間範囲の病院の入院患者でした\" )。または、範囲から1つの値が適用されます（例：「この2回の間に患者に与える」）。\r\n\r\n期間は、期間(経過時間の尺度)には使用されません。Duration](datatypes.html#Duration)を参照のこと。"
* serviceProvider ^short = "The organization (facility) responsible for this encounter / このEncouterに責任を持つ組織（施設）"
* serviceProvider ^definition = "The organization that is primarily responsible for this Encounter's services. This MAY be the same as the organization on the Patient record, however it could be different, such as if the actor performing the services was from an external organization (which may be billed seperately) for an external consultation.  Refer to the example bundle showing an abbreviated set of Encounters for a colonoscopy.\r\n\r\nこのEncouterのサービスに主に責任を持つ組織。これは、患者記録上の組織と同じであってもよいが、例えば、サービスを実行しているアクターが外部組織のものである場合（外部コンサルテーションのために別個に請求される場合がある）など、異なる可能性がある。 大腸内視鏡検査のためのEncouterの省略されたセットを示すバンドル例を参照のこと。"
* serviceProvider ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolveable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* partOf ^short = "Another Encounter this encounter is part of / このEncouterが属するもう一つのEncouter"
* partOf ^definition = "Another Encounter of which this encounter is a part of (administratively or in time).\r\n\r\nこのEncouterが（管理的に、あるいは時間的に）一部となっているもう一つのEncouter。"
* partOf ^comment = "This is also used for associating a child's encounter back to the mother's encounter.\r\rRefer to the Notes section in the Patient resource for further details.\r\n\r\n子供の受診を母親の受診にさかのぼって連携するときにも使われる。\r\n（※出産時などを表していると思われる）\r\n詳細については、Patient ResourceのNotesセクションを参照のこと。"