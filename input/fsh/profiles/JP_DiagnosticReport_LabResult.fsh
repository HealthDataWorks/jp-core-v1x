// ==============================
//   Profile 定義
// ==============================
Profile: JP_DiagnosticReport_LabResult
Parent: JP_DiagnosticReport_Common
Id: jp-diagnosticreport-labresult
Title: "JP Core DiagnosticReport LabResult Profile"
Description: "このプロファイルはDiagnosticReportリソースに対して、検体検査結果のデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_LabResult"
* ^status = #active
* ^date = "2022-09-26"
* . ^short = "A Diagnostic report - a combination of request information, atomic results, images, interpretation, as well as formatted reports　診断レポート-依頼情報、１項目単位の結果、画像、解釈、およびフォーマットされたレポートの組み合わせ　【JP Core仕様】検体検査結果レポートのプロフィール"
* . ^definition = "The findings and interpretation of diagnostic  tests performed on patients, groups of patients, devices, and locations, and/or specimens derived from these. The report includes clinical context such as requesting and provider information, and some mix of atomic results, images, textual and coded interpretations, and formatted representation of diagnostic reports.\r\n\r\n患者、患者のグループ、デバイス、場所、これらから派生した検体に対して実行された診断的検査の結果と解釈。レポートには、依頼情報や依頼者情報などの臨床コンテキスト（文脈）、および１項目単位の結果、画像、テキストとコード化された解釈、および診断レポートのフォーマットされた表現のいくつかの組み合わせが含まれる。\r\nわせ　\r\n【JP Core仕様】検体検査結果レポートのプロフィール"
* identifier ^short = "Business identifier for report　レポートを識別するビジネス識別子"
* identifier ^definition = "Identifiers assigned to this report by the performer or other systems.\r\n実施者または他のシステムによってこのレポートに割り当てられた識別子。"
* identifier ^comment = "Usually assigned by the Information System of the diagnostic service provider (filler id).\r\n発生源の検査室からこのレポートについてクエリを作成するとき、およびFHIRコンテキスト外のレポートにリンクするときに使用する識別子を知る必要がある。\r\n\r\n【JP Core仕様】レポートをユニークに識別する識別子。依頼者オーダ番号と関連付ける場合が多い。\r\n\r\n検体検査の特性として、複数の容器の結果を含む。容器ごと（厳密には項目ごと）に結果のタイミングは異なる場合がある。"
* basedOn ^comment = "Note: Usually there is one test request for each result, however in some circumstances multiple test requests may be represented using a single test result resource. Note that there are also cases where one request leads to multiple reports.\r\n通常、１結果ごとに１つの検査依頼があるが、状況によっては、複数の検査要求に対して１レポートがある場合がある。また 1つの検査依頼に対して複数のレポートが作成される場合もあることに注意。\r\n\r\n【JP Core仕様】ServiceRequestリソースを参照(ObservationLabResultと同様）"
* status ^definition = "The status of the diagnostic report.　診断レポートのステータス。"
* status ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size\r\n\r\n有れば：ORC-5\r\n\r\nもしくは\r\n\r\n無ければ：OBR-25(\"F\")のAND結果\r\n\r\n　例：全部\"F\"なら\"F\"、それ以外の場合は要検討\r\n\r\n設定する値は、DiagnosticReportStatus（コード）から1つ選ぶ\r\n\r\nコード体系：HL7 Table 0038のコードと定義"
* category 1..
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains laboratory 1..1
* category[laboratory] = $diagnostic-service-sectionid-cs#LAB
* category[laboratory] ^comment = "Multiple categories are allowed using various categorization schemes.   The level of granularity is defined by the category concepts in the value set. More fine-grained filtering can be performed using the metadata and/or terminology hierarchy in DiagnosticReport.code.\r\nさまざまなカテゴリ化スキームを使用して、複数のカテゴリを使用できる。粒度のレベルは、それぞれの値セットのカテゴリの概念によって定義される。 DiagnosticReport.codeのメタデータや用語の階層を使用して、よりきめ細かいフィルタリングを実行できる。\r\n\r\n【JP Core仕様】Diagnostic Service Section Codesの\"LAB\"を使用"
* code ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\nすべてのターミノロジの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素と事前・事後の用語作成（pre- and post-coordination）との関係を管理するための独自の構造を提供する必要がある。\r\n\r\n【JP Core仕様】LOINCの臨床検査の分類コードを割り当てる。\r\n\r\n検査レポートの利用用途に合わせて、JLAC10のコードを振っても良い。"
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains laboratoryCode 0..1
* code.coding[laboratoryCode] = http://loinc.org#11502-2 "Laboratory report"
* code.coding[laboratoryCode] ^short = "検体検査レポート項目コード。本ユースケースにおける項目コード推奨値をスライスにて示している。【詳細参照】"
* code.coding[laboratoryCode] ^definition = "検体検査レポート項目コード。本ユースケースにおける項目コード推奨値をスライスにて示している。"
* code.coding[laboratoryCode] ^comment = "推奨コードは必須ではない、派生先によるコード体系を作成し割り振ることを否定しない"
* subject only Reference(JP_Patient)
* subject ^short = "The subject of the report - usually, but not always, the patient　レポートの対象、常にではないが、通常は患者"
* subject ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。\r\n\r\n【JP Core仕様】Patientリソースを参照"
* encounter ^comment = "This will typically be the encounter the event occurred within, but some events may be initiated prior to or after the official completion of an encounter but still be tied to the context of the encounter (e.g. pre-admission laboratory tests).\r\n\r\n【JP Core仕様】入院外来の区別や所在場所、担当診療科の情報に使用する。\r\n\r\n※このプロファイルの用途では通常は必須と考えられるが、ユースケースにより使用されない場合を考慮し、1..1に制約しない。"
* effective[x] ^comment = "If the diagnostic procedure was performed on the patient, this is the time it was performed. If there are specimens, the diagnostically relevant time can be derived from the specimen collection times, but the specimen information is not always available, and the exact relationship between the specimens and the diagnostically relevant time is not always automatic.\r\n診断手順が患者に対して実行された場合、これは実施された時刻。対象が検体である場合は、検体採取時間から診断関連時刻を導き出すことができるが、検体情報が常に入手できるとは限らず、検体と診断関連時刻の正確な関係は必ずしも自明ではない。\r\n\r\n【JP Core仕様】検体採取時間"
* issued ^comment = "May be different from the update time of the resource itself, because that is the status of the record (potentially a secondary copy), not the actual release time of the report.\r\nリソース自体の更新時刻とは異なる場合がある。これは、レポートの実際の提供時刻ではなく、リソース自体の更新時刻はレコード（場合によってはセカンダリコピー）のステータスの更新時刻となるため。\r\n\r\n【JP Core仕様】このデータが出来た時間"
* performer ^comment = "This is not necessarily the source of the atomic data items or the entity that interpreted the results. It is the entity that takes responsibility for the clinical report.\r\n必ずしも１項目データ単位のデータソースまたは結果を解釈した主体でなない。臨床レポートに責任をもつ主体のこと。\r\n\r\n【JP Core仕様】検査に関わった人もしくは組織"
* resultsInterpreter ^comment = "Might not be the same entity that takes responsibility for the clinical report.\r\nレポートに責任を持つ主体とは異なる場合がある。\r\n\r\n【JP Core仕様】検査責任者"
* specimen ^comment = "If the specimen is sufficiently specified with a code in the test result name, then this additional data may be redundant. If there are multiple specimens, these may be represented per observation or group.\r\n検査結果名称のコードを見れば検体情報が十分に判明するような場合には、この検体情報は冗長になる。複数の検体が関与する場合には、検査や検査グループごとに検体情報が記述されることがある。\r\n\r\n【JP Core仕様】該当するspecimenを設定"
* result only Reference(JP_Observation_LabResult)
* result ^definition = "[Observations](observation.html)  that are part of this diagnostic report.\r\n診断レポートの一部"
* result ^comment = "Observations can contain observations.\r\nObservationはobservationを含みうる。\r\n\r\n【JP Core仕様】該当するObservationを設定"
* imagingStudy ^comment = "ImagingStudy and the image element are somewhat overlapping - typically, the list of image references in the image element will also be found in one of the imaging study resources. However, each caters to different types of displays for different types of purposes. Neither, either, or both may be provided.\r\nImagingStudyと画像要素は多少重複する。通常、画像要素内の画像参照のリストは、画像検査リソースのひとつにも存在する。。ただし、それぞれがさまざまなタイプの目的のためにさまざまなタイプのディスプレイに対応している。どちらも、どちらか、または両方を提供することはできない。\r\n\r\n【JP Core仕様】使わない"
* media ^comment = "【JP Core仕様】レポート1つに対して、複数の画像・コメントがぶら下がる"
* media.comment ^comment = "The comment should be displayed with the image. It would be common for the report to include additional discussion of the image contents in other sections such as the conclusion.\r\n\r\n【JP Core仕様】画像に対するコメント"
* media.link ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n【JP Core仕様】画像に対するリンク"
* conclusion ^definition = "Concise and clinically contextualized summary conclusion (interpretation/impression) of the diagnostic report.\r\n 診断レポートの簡潔で臨床的に文脈化された要約結論（解釈/印象）。"
* conclusion ^comment = "Note that FHIR strings SHALL NOT exceed 1MB in size\r\n\r\n【JP Core仕様】原則使わない"
* conclusionCode ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\nすべてのターミノロジの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素と事前・事後の用語作成（pre- and post-coordination）との関係を管理するための独自の構造を提供する必要がある。\r\n\r\n【JP Core仕様】原則使わない"
* presentedForm ^comment = "\"application/pdf\" is recommended as the most reliable and interoperable in this context.\r\napplication / pdf」がこのコンテキストで最も信頼でき相互運用可能なものとして推奨される。\r\n\r\n【JP Core仕様】原則使わない"