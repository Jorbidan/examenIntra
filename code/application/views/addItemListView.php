<!-- Question 1 -->

<form class="needs-validation" action="/itemslist/add" method="POST" novalidate>
    <div class="form-group">
        <div class="col-md-6 mb-3">
            <label for="nomItem">Nom de l'item</label>
            <input type="text" class="form-control" id="nomItem" name="nomItem" placeholder="Nom Item"
                required pattern="[A-Za-z]{3,}">
            <div class="invalid-feedback">
                Un nom doit etre indiqué
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-6 mb-3">
            <label for="quantity">Quantité</label>
            <input type="number" class="form-control" id="quantity" name="quantity" min="1" required>
            <div class="invalid-feedback">
                La quantité doit être supérieur à 0
            </div>
        </div>
    </div>
    <div class="col-md-6 mb-3">
        <button type="submit" class="btn btn-primary">Ajouter</button>
    </div>
</form>
