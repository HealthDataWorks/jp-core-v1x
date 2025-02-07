// ==============================
//   DataType 定義
// ==============================
Profile: JP_MedicationTiming
Parent: Timing
Id: jp-medicationtiming
Title: "JP Core Medication Timing DataType"
Description: "このデータタイプはTiming DataTypeに対して、薬剤に関するタイミング定義を行なったものである"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationTiming"
* ^status = #active
* ^date = "2022-09-26"
* . ^short = "投与日時"
* . ^definition = "投与日時"
* event ^short = "服用もしくは注射を行なうタイミングを示す時刻"
* event ^definition = "服用タイミングを具体的な日時で指定する場合に使用する"
* repeat ^short = "イベントが発生する時刻"
* repeat ^definition = "イベントがスケジュールされたルールについての記述。"
* repeat ^requirements = "スケジュールされたタイミングの多くは規則的な繰り返しで決定されている。"
* repeat.bounds[x] ^short = "服用・注射開始日から服用・注射終了日までの全日数"
* repeat.bounds[x] ^definition = "服用・注射開始日から服用・注射終了日までの全日数。実投与日数ではないことに注意する。"
* repeat.count ^short = "繰り返し服用もしくは注射回数"
* repeat.count ^definition = "Timing仕様の全てにおいて、特定の期間に繰り返されるように指定された総回数。もし、countMaxが設定されていれば、このエレメントは許容される最低限度の回数を示す。"
* repeat.count ^comment = "回数に上限、下限の範囲がある場合は、このcountで示される回数が起きるまでは、エレメントは範囲の中にあると解釈されるべきである。"
* repeat.countMax ^short = "繰り返しの最大回数"
* repeat.countMax ^definition = "このエレメントが設定されている場合は、回数に範囲があることを示している。したがって、[count]から[countmax]までの回数で繰り返される。"
* repeat.countMax ^comment = "32bit整数。もし、値がこれを超える場合はdecimalで記録される。"
* repeat.duration ^short = "継続時間"
* repeat.duration ^definition = "投与されるタイミングが発生している時間。もし、durationMaxが設定されていれば、このエレメントは許容される継続時間の下限を示す。"
* repeat.duration ^comment = "継続時間はイベントの定義の一部（たとえば、静脈注射(IV)では特定の量と速度が明示される)として示されることがある。その他、Timing仕様の一部（たとえば、運動）として示されることもある。"
* repeat.duration ^requirements = "アクティビティによっては即時的なものではなく、その期間において維持される必要がある。"
* repeat.durationMax ^short = "継続時間(最大値)"
* repeat.durationMax ^definition = "もし、このエレメントに値が設定されていれば、durationには範囲があることを示している。したがって、[duration]から[durationMax]までの継続時間の範囲で投与される。"
* repeat.durationMax ^comment = "継続時間はイベントの定義の一部（たとえば、静脈注射(IV)では特定の量と速度が明示される)として示されることがある。その他、Timing仕様の一部（たとえば、運動）として示されることもある。"
* repeat.durationMax ^requirements = "アクティビティによっては即時的なものではなく、その期間において維持される必要がある。"
* repeat.durationUnit ^definition = "UCUM単位で表される継続時間についての単位。"
* repeat.durationUnit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* repeat.frequency ^short = "期間内にイベントが発生する回数、頻度"
* repeat.frequency ^definition = "特定の期間に繰り返して発生した行為の回数。もし、frequencyMaxが設定されていれば、このエレメントはfrequencyとして認められた下限を示す。"
* repeat.frequency ^comment = "32ビットの数値。もし、値がそれを上回るようであればdecimalを使用する。"
* repeat.frequency ^meaningWhenMissing = "frequencyが指定されていなければ、期間内に1回だけイベントが発生すると想定される。しかし、システムはこれを常時特定しておく必要がある。"
* repeat.frequencyMax ^short = "期間内にイベントが発生する最大回数、最大頻度"
* repeat.frequencyMax ^definition = "このエレメントに値が設定されていれば、frequencyには範囲が指定されている。つまり、期間あるいは期間の範囲内に[frequency]から[frequencyMax]回繰り返されることを示している。"
* repeat.frequencyMax ^comment = "32ビットの数値。もし、値がそれを上回るようであればdecimalを使用する。"
* repeat.period ^short = "イベントが発生する頻度に対応する期間"
* repeat.period ^definition = "繰り返し投与が行われる期間を示す。たとえば、「1日3回」であれば、3は繰り返しの頻度(frequency)であり、「1日」が期間(period)である。もし、periodMaxに値が設定されていれば、このエレメントは期間として認められた範囲の下限を示す。"
* repeat.period ^comment = "IEEEの浮動小数点型を使わずに、小数点も含むdecimal型のようなものを利用すること（たとえばJavaのBigInteger)。"
* repeat.periodMax ^short = "期間の上限（3-4時間）"
* repeat.periodMax ^definition = "もし、この値が設定されていれば、期間は[period]から[periodMax]までであることを示し、「3-5日に1回投与」のような表現が認められる。"
* repeat.periodMax ^comment = "IEEEの浮動小数点型を使わずに、小数点の制度も示すdecimal型のようなものを利用すること（たとえばJavaのBigInteger)。"
* repeat.periodUnit ^definition = "期間を表すUCUM単位。"
* repeat.periodUnit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* repeat.dayOfWeek ^definition = "期間として1週間以上が指定されていれば、指定された曜日のみで投与が行われる。"
* repeat.dayOfWeek ^comment = "曜日が指定されていなければ、他に指定された日には毎日投与されると想定される。frequencyとperiodエレメントはdayOfWeekと同じように使うことはできない。"
* repeat.timeOfDay ^short = "一日の間で投与される時刻"
* repeat.timeOfDay ^definition = "一日の間で指定された投与される時刻。"
* repeat.timeOfDay ^comment = "もし、このtimeOfDayに値が指定されていれば、毎日（daysOfWeekでフィルタされた曜日の）指定された時刻に投与されると推定される。whenやfrequency, periodエレメントはtimeOfDayとは同様に使うことはできない。"
* repeat.when ^short = "投薬期間についてのコード"
* repeat.when ^definition = "一日の間のおおよその時間帯で投与すべきタイミングを示す。日常のイベントに関連付けられていることもある。"
* repeat.when ^comment = "一つ以上のイベントが記載されている場合、そのイベントは特定のイベントの組み合わせと結びついている。"
* repeat.when ^requirements = "タイミングはしばしば起床や食事、睡眠などのできごとによってしばしば決定されている。"
* repeat.offset ^short = "イベントからの時間(分、前後）"
* repeat.offset ^definition = "イベントからの時間(分)。もし、分で示される時間がイベントのコードが前か後かを示していない場合、offsetはイベントの後であることが想定される。"
* repeat.offset ^comment = "32ビットの数値。もし、値がそれを上回るようであればdecimalを使用する。"
* code ^definition = "スケジュール上のタイミングを表すコード（あるいはcode.text内のテキスト）。BID(1日2回)のようなコードはどこにでもあるが、多くの医療機関は付加的なコードを定義している。もし、コードが示されていれば、構造化されたタイミングで完全に示されたデータであると解釈され、コードまたはTimingを解釈するためのデータであると解釈される。しかし、例外的に.repeat.bounds（コードは含まれない)はコードを上書きして適用される。"
* code ^comment = "BIDなどは「施設特有の時間」として定義される。たとえば、施設がBIDを「つねに朝7時と夕方6時」であると指定することがある。この指定が不適切であれば、BIDというコードは使うべきではない。その代わり、HL7が定義したBIDのコードではなく、その施設特有のコードで明示的に示すべきであり、構造化された表現を使うべきである（この場合、2回のイベントの時刻を指定する必要がある）。"
