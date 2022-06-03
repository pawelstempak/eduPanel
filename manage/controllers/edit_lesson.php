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
	  $errors[]='Plik nie mo�e by� wi�kszy ni� 2 MB.';
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

############# Usuni�cie z MySQL za��cznika ################
if(isset($_GET['action']) && $_GET['action']=="delete_attachment") {

	$stmt = $pdo -> query("
	SELECT *
	FROM attachment
	WHERE id_attachment = '".$_GET['action_id']."';
	");
	$attachment = $stmt -> fetch();

	$stmt->closeCursor();
	unset($stmt);

	unlink(ABSOLUTE_PATH_EDU."files/".$attachment['filename']);

	$pdo -> exec("
					DELETE FROM attachment
					WHERE id_attachment = '".$_GET['action_id']."'
					");
}

############# Zapis do MySQL danych kursu ################
if(isset($_POST['save']) or isset($_POST['save_close']))
{
	if(isset($_POST['attachment']) and $_POST['attachment']!="")
	{
		$filename = file_upload();
			$pdo -> exec("
				INSERT INTO attachment
				SET filename = '".$filename."', id_lesson = '".$_GET['id']."'
			");

	}

		$pdo -> exec("
			UPDATE lesson
			SET name = '".$_POST['name']."', content = '".$_POST['content']."'
			WHERE id_lesson = '".$_GET['id']."'
		");

		$pdo -> exec("
			UPDATE lesson_course
			SET id_course = '".$_POST['course']."'
			WHERE id_lesson = '".$_GET['id']."'
		");

	if(isset($_POST['save'])){header("Location: edit_lesson,save,".$_GET['id']."");}elseif(isset($_POST['save_close'])){header("Location: lessons,ok,".$_POST['course']);}

}
############### Wczytaj list� kurs�w do listy SELECT ####################
$stmt = $pdo -> query("
							SELECT *
							FROM course
							ORDER by name
");
foreach($stmt as $row)
{
	$courses[] = $row;
}

$stmt->closeCursor();
unset($stmt);

$smarty->assign('course',$courses);
#########################################################################

############### Wczytaj list� za��cznik�w ####################
$stmt = $pdo -> query("
							SELECT *
							FROM attachment
							WHERE id_lesson = '".$_GET['id']."'
							ORDER by name
");
foreach($stmt as $rowt)
{
	$attachments[] = $rowt;
}

$stmt->closeCursor();
unset($stmt);
if(isset($attachments)) $smarty->assign('attachments',$attachments);
#########################################################################

################ Wczytanie danych dla wy�wietlanej lekcji ###############
$stmt = $pdo -> query("
SELECT *
FROM lesson l, lesson_course c
WHERE l.id_lesson = '".$_GET['id']."' and l.id_lesson = c.id_lesson;
");
$lesson = $stmt -> fetch();

$stmt->closeCursor();
unset($stmt);

$smarty->assign('lesson',$lesson);
########################################################################

?>