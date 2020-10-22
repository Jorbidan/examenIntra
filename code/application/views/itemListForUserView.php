<!-- Question 2-->
<form method="GET" novalidate>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Nom de l'item</th>
      <th scope="col">Quantité</th>
    </tr>
  </thead>
  <tbody>
  <?php 
            foreach($items as $items){
                 echo("<tr><th scope='row'>".$items->get_id()."</th><td>".$items->get_name()."</td><td>".$items->get_quantity()."</td></tr>");
            }
    ?>
  </tbody>
</table>
</form>


