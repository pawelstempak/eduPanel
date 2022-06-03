<?php
function file_upload() {

 if(isset($_FILES['attachment'])){
       $errors= array();
           $file_name = $_FILES['attachment']['name'];
           $file_size =$_FILES['attachment']['size'];
           $file_tmp =$_FILES['attachment']['tmp_name'];
           $file_type=$_FILES['attachment']['type'];
	$extensions= array("jpeg","jpg","png","pdf","doc","xls","docx","xlsx","ppt");

   $file_ext=strtolower(end(explode('.',$_FILES['attachment']['name'])));
	if(in_array($file_ext,$extensions)=== false){
	  $errors[]="Rozszerzenie niedozwolone.";
	}
	if($file_size > 2097152){
	  $errors[]='Plik nie mo¿e byæ wiêkszy ni¿ 2 MB.';
	}
	$file_name = time()."_".$file_name;
   if(empty($errors)==true){
      move_uploaded_file($file_tmp,ABSOLUTE_PATH_EDU."files/".$file_name);

		return $file_name;
   }
   else{
      print_r($errors);
   }

}

}

############# Zapis do MySQL danych kursu ################
if(isset($_POST['save']) or isset($_POST['save_close']))
{
		$pdo -> exec("
			INSERT INTO lesson
			SET name = '".$_POST['name']."', content = '".$_POST['content']."'
		");

		$stmt = $pdo -> query("
							SELECT id_lesson
							FROM lesson
							WHERE id_lesson = LAST_INSERT_ID();
		");
		$last_id = $stmt -> fetch();

		$stmt->closeCursor();
		unset($stmt);

		$stmt = $pdo -> query("
							SELECT max(sort)
							FROM lesson_course
							WHERE id_course = '".$_POST['course']."';
		");
		$MAX_SORT = $stmt -> fetchColumn();
		$MAX_SORT++;
		$pdo -> exec("
			INSERT INTO lesson_course
			SET id_lesson = '".$last_id['id_lesson']."', id_course = '".$_POST['course']."', sort = '".$MAX_SORT."'
		");
		$stmt->closeCursor();
		unset($stmt);

		if(isset($_POST['attachment']) and $_POST['attachment']!="")
		{
			$filename = file_upload();
				$pdo -> exec("
					INSERT INTO attachment
					SET filename = '".$filename."', id_lesson = '".$last_id['id_lesson']."'
				");

		}

	if(isset($_POST['save'])){header("Location: edit_lesson,save,".$last_id['id_lesson']."");}elseif(isset($_POST['save_close'])){header("Location: lessons,ok");}

}

$stmt = $pdo -> query("
							SELECT *
							FROM course
							ORDER BY name
");
foreach($stmt as $row)
{
	$courses[] = $row;
}

$stmt->closeCursor();
unset($stmt);

$smarty->assign('course',$courses);
?>