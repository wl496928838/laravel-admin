
<div class="form-group">
    <label
            class="col-sm-3 control-label"><strong><?php echo $schema['title']; ?>
            ：</strong></label>

    <div class="col-sm-3">
                                                <textarea name="<?php echo $schema['name']; ?>"
                                                          id="" <?php if (empty($schema['rule'])) {
                                                    echo 'ignore="ignore"';
                                                } else {
                                                    echo 'datatype=' . $schema['rule'];
                                                }; ?> errormsg="<?php echo $schema['err_message']; ?>"
                                                          class=" form-control <?php echo $schema['class']; ?>"
                                                         ><?php echo $data->$schema['name'] == '' ? $schema['default'] : $data->$schema['name'];; ?></textarea>
        <span class="help-block"><?php echo $schema['notice']; ?></span>

        <div class="alert alert-danger hide" role="alert">
                                                    <span class="glyphicon glyphicon-exclamation-sign"
                                                          aria-hidden="true"></span>
            <span class="sr-only">Error:</span>
            <span class="err_message"></span>
        </div>
    </div>
</div>