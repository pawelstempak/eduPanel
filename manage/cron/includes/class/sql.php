<?php

//require './smarty/libs/Smarty.class.php';

class sql
{
	var $data; //dane 1
	var $data_all; // dane 2
	var	$filter;	//SQL: WHERE
	var $rows; //ile rekordow pobrano

	var	$db; //polaczenie do bazy danych
	var	$table; //tabela na ktorej pracujemy
	var $q;

	// constructor
	function sql()
	{
		global $cfg;
		$this->db = mysql_connect($cfg['database_url'], $cfg['database_login'], $cfg['database_password']) or die ("<center>Serwis chwilowo niedostepny.<br>Za utrudnienia przepraszamy.<br> Zapraszamy za chwile.</center>");
		mysql_select_db($cfg['database_name'],$this->db);
		$db_set = mysql_query ("SET NAMES utf8");
	}

	// desctructor
	function destroy()
	{
		mysql_close($this->db);
	}
	function reset()
	{
		$this->data = array();
	}
	// sets KEY=>VALUE
	function set($key,$value)
	{
		$this->data[$key]=$value;
	}

	// gets VALUE
	function get($key)
	{
		return $this->data[$key];
	}

	// zwraca liste wartosci w formacie do zapytania SQL
	function get_vals()
	{
		$val=array();
		foreach($this->data as $w)
		{
			$val[]='\''.$w.'\'';
		}
		return implode(', ',$val);
	}

	function get_atr()
	{
		return implode(', ', array_keys($this->data));

	}

	function get_atr_val()
	{
		$r=array();
		foreach($this->data as $k=>$w)
		{
			$r[]=$k.'=\''.$w.'\'';
		}
		return implode(', ', $r);
	}

	function insert_db()
	{
		 $this->q= mysql_query('INSERT INTO '.$this->table.'( '.$this->get_atr().' ) VALUES( '.$this->get_vals().' )');
		 return mysql_insert_id($this->db);
//		 echo('INSERT INTO '.$this->table.'( '.$this->get_atr().' ) VALUES( '.$this->get_vals().' )');
	}
	function set_table($name)
	{
		global $cfg;
		$this->table = $cfg['db_prefix'].$name;
	}

	function load_db($id)
	{
		$this->q = mysql_query('SELECT '.$this->get_atr().' FROM '.$this->table.' WHERE id=\''.$id.'\'');
		$this->data=mysql_fetch_assoc($this->q);
	}

	function load_db2($filter)
	{
		$this->q = mysql_query('SELECT '.$this->get_atr().' FROM '.$this->table.' WHERE '.$filter);
		$this->data=mysql_fetch_assoc($this->q);
		return $this->data;

	}
	function load_db_all()
	{
		$a=array();

//echo('SELECT '.$this->get_atr().' FROM '.$this->table.' WHERE '.$this->filter);
		if($this->q = mysql_query('SELECT '.$this->get_atr().' FROM '.$this->table.' WHERE '.$this->filter))
		{
		$this->rows = mysql_num_rows($this->q);

		}


		if(!($this->rows == 0))
		{
			while($a=mysql_fetch_assoc($this->q))
			{
				$this->data_all[]=$a;
			}
		}
		unset($a);
		return $this->data_all;
	}

	function load_db_limit($from,$to)
	{
		$a=array();
//		echo 'SELECT '.$this->get_atr().' FROM '.$this->table.' WHERE '.$this->filter;
		$this->q = mysql_query('SELECT '.$this->get_atr().' FROM '.$this->table.' WHERE '.$this->filter.' LIMIT '.$from.','.$to);

		$this->rows = mysql_num_rows($this->q);
		$this->data_all = array();
		while($a=mysql_fetch_assoc($this->q))
		{
			$this->data_all[]=$a;
		}
		unset($a);
		return $this->data_all;
	}

// sprawdzanie poprawnosci zapytania
	function query($f)
	{

		$this->q = mysql_query($f);

		return $this->q;
	}
// zwracanie liczby wierszy zapytania
	function number_rows($f)
	{

		if($this->query($f))
		{
			$this->rows = mysql_num_rows($this->q);
		}
		return $this->rows;
	}

	function rows($f)
	{

		$this->rows = mysql_num_rows($f);
		return $this->rows;
	}

	function rows_query($filter)
	{
		$this->q = mysql_query('SELECT '.$this->get_atr().' FROM '.$this->table.' WHERE '.$filter);
		if($this->q)
		{
			$this->rows = mysql_num_rows($this->q);
		}
		return $this->rows;
	}

	function fetch_asc($q)
	{

		$this->data_all = array();
		while($a=mysql_fetch_assoc($q))
		{
			$this->data_all[]=$a;
		}
		unset($a);
		return $this->data_all;
	}
	function fetch_asc_plus($q,$r)
	{

		$this->data_all = array();
		while($a=mysql_fetch_assoc($q))
		{
			$this->data_all[]=$a;
		}
		unset($a);
		while($a=mysql_fetch_assoc($r))
		{
			$this->data_all[]=$a;
		}
		return $this->data_all;
	}
	function fetch($q)
	{
		return mysql_fetch_assoc($q);
	}
	function fetch_ob($q)
	{
		return mysql_fetch_object($q);
	}
	function delete_db($id)
	{
		$this->q = mysql_query('DELETE FROM '.$this->table.' WHERE id =\''.$id.'\'');

	}
	function delete_db2($id)
	{
		$this->q = mysql_query('DELETE FROM '.$this->table.' WHERE id >\''.$id.'\'');

	}
	function delete_db3($filter)
	{
		$this->q = mysql_query('DELETE FROM '.$this->table.' WHERE '.$filter);

	}
	function update_db($id)
	{
		$this->q = mysql_query('UPDATE '.$cfg['db_prefix'].$this->table.' SET '.$this->get_atr_val().' WHERE id=\''.$id.'\'');
		return $this->q ;
	}
	function update_db2($filter)
	{
		$this->q = mysql_query('UPDATE '.$cfg['db_prefix'].$this->table.' SET '.$this->get_atr_val().' WHERE '.$filter);
		return $this->q ;
	}
	function lastid()
	{
		return mysql_insert_id($this->q);
	}
	function list_tables()
	{
		global $cfg;
		return mysql_list_tables ($cfg['db_name']);
	}
}//end:TSQL

?>