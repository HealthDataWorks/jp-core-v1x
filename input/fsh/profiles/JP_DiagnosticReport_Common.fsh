// ==============================
//   Profile 定義
// ==============================
Profile: JP_DiagnosticReport_Common
Parent: DiagnosticReport
Id: jp-diagnosticreport-common
Title: "JP Core DiagnosticReport Common Profile"
Description: "このプロファイルはDiagnosticReportリソースに対して、データを送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Common"
* ^status = #active
* . ^short = "診断レポート-依頼情報、１項目単位の結果、画像、解釈、およびフォーマットされたレポートの組み合わせ。【詳細参照】"
* . ^definition = "患者、患者のグループ、デバイス、場所、これらから派生した検体に対して実行された診断的検査の結果と解釈。レポートには、依頼情報や依頼者情報などの臨床コンテキスト（文脈）、および１項目単位の結果、画像、テキストとコード化された解釈、および診断レポートのフォーマットされた表現のいくつかの組み合わせが含まれる。"
* . ^comment = "これは単一のレポートをキャプチャすることを目的としており、複数のレポートをカバーする要約情報の表示に使用するのには適していない。たとえば、このリソースは、検査結果の累積レポート形式やシーケンスの詳細な構造化レポート用に作られていない。\r\n\r\n【JP Core仕様】DiagnosticReportリソースの共通プロフィール"
* identifier ^short = "レポートを識別するビジネス識別子。【詳細参照】"
* identifier ^definition = "実行者または他のシステムによってこのレポートに割り当てられた識別子。"
* identifier ^comment = "通常、診断サービスプロバイダの情報システム（フィラーID）によって割り当てられる。"
* identifier ^requirements = "発生源の検査室からこのレポートについてクエリを作成するとき、およびFHIRコンテキスト外のレポートにリンクするときに使用する識別子を知る必要がある。"
* basedOn ^short = "元になった検査や診断の依頼。【詳細参照】"
* basedOn only Reference(CarePlan or ImmunizationRecommendation or JP_MedicationRequest or JP_MedicationRequest_Injection or NutritionOrder or ServiceRequest)
* basedOn ^definition = "依頼されたサービス（検査や診断など）に関する詳細情報"
* basedOn ^comment = "通常、１結果ごとに１つの検査依頼があるが、状況によっては、複数の検査要求に対して１レポートがある場合がある。また１つの検査依頼に対して複数のレポートが作成される場合もあることに注意。"
* status ^definition = "診断レポートのステータス。"
* category ^short = "サービスカテゴリー。【詳細参照】"
* category ^definition = "レポートを作成した臨床分野、部門、または診断サービス（心臓病学、生化学、血液学、MRIなど）を分類するコード。これは、検索、並べ替え、および表示の目的で使用される。"
* category ^comment = "さまざまなカテゴリ化スキームを使用して、複数のカテゴリを使用できる。粒度のレベルは、それぞれの値セットのカテゴリの概念によって定義される。 DiagnosticReport.codeのメタデータや用語の階層を使用して、よりきめ細かいフィルタリングを実行できる。"
* code ^short = "この診断レポートの名前/コード。【詳細参照】"
* code ^definition = "この診断レポートを説明するコードまたは名前。"
* code ^comment = "すべてのターミノロジの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素と事前・事後の用語作成（pre- and post-coordination）との関係を管理するための独自の構造を提供する必要がある。"
* subject only Reference(JP_Patient or Group or Device or JP_Location)
* subject ^short = "レポートの対象、常にではないが、通常は患者。【詳細参照】"
* subject ^definition = "レポートの対象、常にではないが、通常、患者。ただし、診断サービスは、他のさまざまなソースから収集された検体を対象とすることもある。"
* subject ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、内容に辿り着ける（解決できる）必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* encounter only Reference(JP_Encounter)
* encounter ^short = "依頼時におけるヘルスケアイベント（受診など）。【詳細参照】"
* encounter ^definition = "このDiagnosticReportが対象とするヘルスケアイベント（患者とヘルスケアプロバイダの相互関係など）。受診、入院、診察など。"
* encounter ^comment = "通常、イベントが発生したEncounterであるが、一部のイベントは、エンEncounterの正式な完了の前または後に開始される場合があり、その場合でもEncounterのコンテキストに関連付けられている（例：入院前の臨床検査）。"
* effective[x] ^short = "臨床的に関連する時刻または時間。【詳細参照】"
* effective[x] ^definition = "観測値が関連する時間または期間。レポートの対象が患者である場合、これは通常、処置や検体採取の時刻のいずれかであるが、日付/時刻の出処は不明であり、日付/時刻自体のみのことがある。"
* effective[x] ^comment = "診断手順が患者に対して実行された場合、これは実施された時間である。対象が検体である場合は、検体採取時間から診断関連時刻を導き出すことができるが、検体情報が常に入手できるとは限らず、検体と診断関連時刻の正確な関係は必ずしも自明ではない。"
* issued ^short = "このバージョンが作成された日時。【詳細参照】"
* issued ^definition = "このバージョンのレポートが医療者に提供された日時。通常、レポートがレビューおよび検証・確定された後となる。"
* issued ^comment = "リソース自体の更新時刻とは異なる場合がある。これは、レポートの実際の提供時刻ではなく、リソース自体の更新時刻はレコード（場合によってはセカンダリコピー）のステータスの更新時刻となるため。"
* performer only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or CareTeam)
* performer ^short = "レポート内容に責任をもつ診断的サービス。【詳細参照】"
* performer ^definition = "レポートの作成発行に責任をもつ診断サービス。"
* performer ^comment = "必ずしも１項目データ単位のデータソースまたは結果を解釈した主体でなない。臨床レポートに責任をもつ主体のこと。"
* resultsInterpreter only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or CareTeam)
* resultsInterpreter ^short = "結果の一次解釈者。【詳細参照】"
* resultsInterpreter ^definition = "レポートの結論と解釈に責任を持つ医療者あるいは組織。"
* resultsInterpreter ^comment = "レポートに責任を持つ主体とは異なる場合がある。"
* specimen ^short = "レポートのもとになった検体。【詳細参照】"
* specimen ^definition = "この診断レポートのもとになった検体に関する詳細情報。"
* specimen ^comment = "検査結果名称のコードを見れば検体情報が十分に判明するような場合には、この検体情報は冗長になる。複数の検体が関与する場合には、検査や検査グループごとに検体情報が記述されることがある。"
* result ^short = "検査結果。Observationsリソースが参照される。【詳細参照】"
* result ^definition = "診断レポートの一部としてのObservationsリソース。"
* result ^comment = "Observationはobservationを含むことができる。"
* result ^requirements = "個々の結果または結果のグループをサポートする必要がある。結果のグループ化は任意だが、意味がある場合にグループ化される。"
* imagingStudy ^short = "診断レポートに関連づけれらた画像検査の詳細情報への参照。【詳細参照】"
* imagingStudy ^definition = "診断的精査中に実施されたなんらかの画像検査の詳細情報へのひとつ以上のリンク。通常は、DICOM対応のモダリティーによって実施される画像検査であるが、必須ではない。完全対応のPACSビューワはこの情報を使用して原画像の一覧を提供できる。"
* imagingStudy ^comment = "ImagingStudyと画像要素は多少重複する。通常、画像要素内の画像参照のリストは、画像検査リソースのひとつにも存在する。ただし、それぞれがさまざまなタイプの目的のためにさまざまなタイプのディスプレイに対応する。どちらも、どちらか、または両方を提供することはできない。"
* media ^short = "このレポートに関連づけられたキー画像。【詳細参照】"
* media ^definition = "このレポートに関連する主要な画像のリスト。画像は通常、診断プロセス中に作成され、患者から直接か、調製された検体標本（つまり、関心のあるスライド）のこともある。"
* conclusion ^short = "検査結果の臨床的結論（解釈）。【詳細参照】"
* conclusion ^definition = "診断レポートの簡潔で臨床的に文脈化された要約結論（解釈/印象）。"
* conclusionCode ^short = "検査結果の臨床的結論（解釈）用のコード。【詳細参照】"
* conclusionCode ^definition = "診断レポートの要約的な結論（解釈/印象）を表す1つ以上のコード。"
* conclusionCode ^comment = "すべてのターミノロジの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素間の関係とpre-coordinationとpost-coordinationの用語関係を管理するための独自の構造を提供する必要がある。"
* presentedForm ^short = "発行されたレポート全体。【詳細参照】"
* presentedForm ^definition = "診断サービスによって発行された結果全体のリッチテキスト表現。複数のフォーマットが許可されるが、それらは意味的に同等である必要がある。"
* presentedForm ^comment = "「application / pdf」がこのコンテキストで最も信頼でき相互運用可能なものとして推奨される。"