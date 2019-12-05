<?php 
include $_SERVER['DOCUMENT_ROOT'].'/header.php';
include $_SERVER['DOCUMENT_ROOT'].'/db.php';
include $_SERVER['DOCUMENT_ROOT'].'/api.php'; 
?>
	<div id="content">
		<div id="main" class="container">
			
			<div class = "shadow-sm" id="grid"></div>

			<button id="show_add_country_btn" class="btn btn-outline shadow-sm" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false"><strong><i class="fas fa-plus"></i> Добавить страну</strong></button>

			<div class="collapse" id="collapseExample">
				<div class="card card-body bg-light shadow">

					<form method="POST" class="needs-validation" id="country_send_ajax_form" novalidate>	
						<div class="form-row">

							<div class="form-group col-md-6">
								<label for="country_name">Название страны</label>
								<input type="text" pattern="^[А-Яа-я -]+$" class="form-control" id="country_name" name="country_name" placeholder="Введите название страны"  required>
								<div class="invalid-feedback">
									Пожалуйста, введите название страны. Допускается использование "А-я", " " и "-".
								</div>
							</div>

							<div class="form-group col-md-6">
								<label for="capital_name">Название столицы</label>
								<input type="text" pattern="^[А-Яа-я -]+$" class="form-control" id="capital_name" name="capital_name" placeholder="Введите название столицы" required>
								<div class="invalid-feedback">
									Пожалуйста, введите название столицы. Допускается использование "А-я", " " и "-".
								</div>
							</div>

							<div class="form-group col-md-8">
								<label for="country_area">Площадь страны в кв. км</label>
								<input type="text" class="form-control" id="country_area" name="country_area" placeholder="Введите площадь страны" required>
								<div class="invalid-feedback">
									Пожалуйста, введите площадь страны
								</div>
							</div>

							<div class="form-group col-md-4">
								<label for="region_name">Регион</label>
								<select class="form-control" name="region_name" id="region_name">
								<?php
									$regions = getAllRegions($db);
									foreach ($regions as $key => $region) {
										echo "<option value=".$region['id'].">".$region['name']."</option>";
									}
								?>	
								</select>
							</div>

						</div>	

						<button type="submit" id="country_send_ajax_btn" class="btn shadow-sm" disabled>Добавить</button>

					</form>	

				</div>
			</div>
				
		</div>
	</div>

<?php 
include $_SERVER['DOCUMENT_ROOT'].'/footer.php';
?>