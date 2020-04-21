{
  function update() {

    document.querySelector('h1').textContent = 'changed!';
    querySelector = 最初のものだけ
    querySelectorALL('p')[1].textContent = 'hello';
    querySelectorALL('p').forEach((p,index) => {
      p.textContent = '${index}番目のpです';
    });
    // document.querySelector('button').addEventListener('click',update);
    document.querySelector('button').addEventListener('click',()=>{
      document.getElementById('target').textContent = 'changed';
    });
    

    document.getElementById('target').textContent = 'changed!';
    .className = 'my-color';
    .classList.add('mycolor');
    .classList.contain('my-color') ===true){
      .classList.add.remove

      targetNode.classList.toggle('mycolor');
      targetNode.textContent = 'dotinstall';
      カスタムデータ属性
      data-translation = 'dotinstall';
    }
  }

  setTimeout(update.1000);

}


