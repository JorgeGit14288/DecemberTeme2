<HTML>

    <HEAD>

        <script type="text/javascript">

            function checkifempty()
            {
                if (!document.form.condicion.checked)
                {
                    document.form.btnenvio.disabled = true;
                    
                } else
                {
                    document.form.btnenvio.disabled = false;
                }

            }
        </script>


    </HEAD>


    <BODY>

        <form id="form" name="form">

            <input type="checkbox" name="condicion" id="condicion" onclick="checkifempty()"/>
            <input class="btn btn-lg btn-success btn-block" name="btnenvio"  type="submit"  id="registrarse" disabled="true">
        </form>

    </BODY>

</HTML>