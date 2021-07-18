$(function() {
  let index = 1;
  // 最初に"index"の定義を忘れないように。
  $('.class-parent')
  // 私の場合は、"追加するボタン"と"追加したい子供"を全部囲む形でdivを作ってclassを付与したらいけました。この辺は要調節**
    .on('cocoon:after-insert', function(e, insertedItem) {
    // 'cocoon:after-insert'このイベントがキモです。他にも挿入前に実行するイベント、削除前・削除後に実行するイベントがあるので、気になる方は公式サイトをご覧ください。
      $(insertedItem).find('.class-a').attr('data-a', index);
      $(insertedItem).find('.class-b').attr('data-b', index);
      $(insertedItem).find('.class-c').attr('data-c', index);
      // 挿入したアイテムにdata属性を付与しています。 idを渡したい時は.attrの後ろをdata属性からidへ変更してください。
      // 例）.attr('id','index') **ちなみにindexは変数なんで、なんでもOKです。
      // HTMLでこのような表記になります => data-a="index"

      index = index+1
      // indexへ1づつ追加することで、個別の数字をdata属性に付与することができます。

      $('.data-a').on('change',function(e){
      // 与えたdata属性を使ってイベントを起こす。
      // 今回はAにchangeが起こったら、BとCのtextにAに基づいた値を入れるというイベントです。

        const dataA = $(this).attr('data-a')
        // dataAのchangeが起ったindex(数字)を取得しています。
        const dataB = $("option:selected", this).data("b");
        const dataC = $("option:selected", this).data("c");

        $(`[data-b="${dataA}"]`).text(dataB)
        $(`[data-c="${dataA}"]`).text(dataC)
      })
    })
})