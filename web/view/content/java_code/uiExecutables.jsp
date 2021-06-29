<div class="content-header">UI and Executables</div>

<div class="content">
    The UI is built using JavaFX Scene Builder.
</div>

<div class="content">
    Command-line executables call executable classes that parse the arguments and call the same Java methods as the interface.
</div>

<div class="content">
    Scene Builder creates the musicxmltasks.fxml file that describes the component parts, and maps interface widgets to method calls.
</div>

<div class="content">
    Invoked methods are in class TasksController.
    On button press, method buttonPressed() is invoked which sets up the TaskExecutor in a new thread.
</div>

<div class="content">
    <textarea class="example" readonly rows="13">
    @FXML
    private void buttonPressed(ActionEvent actionEvent) {
        taskForm.clearOutput();

        Button button = (Button)actionEvent.getSource();

        // Run task in thread
        TaskExecutor taskExecutor = new TaskExecutor(button.getId(), taskForm);
        Runnable taskRunnable = taskExecutor::execute;
        Thread formThread = new Thread(taskRunnable);
        formThread.start();
    }
    </textarea>
</div>

<div class="content">
    TaskExecutor resolves which button is pressed, handles the input, calls the executable, and handles state updates in a separate thread.
</div>

<div class="content">
    <textarea class="example" readonly rows="98">
    public void execute() {
        InputHandler inputHandler = null;
        JavafxTaskInitializer taskInitializer = null;
        boolean isPropertiesSettingsUpdate = false;
        boolean isLyPdfPropertiesUpdate = false;
        boolean isDbUpdate = false;
        boolean isOutputSettingsUpdate = false;
        switch (controlId) {
            case FormNode.SAVE_DB_SETTINGS_BUTTON:
                taskInitializer = new SaveDbSettingsInitializer(taskForm);
                inputHandler = new SetDbPropertiesHandler();
                isPropertiesSettingsUpdate = true;
                break;
            case FormNode.SAVE_LY_PDF_SETTINGS_BUTTON:
                taskInitializer = new LyPdfSettingsInitializer(taskForm);
                inputHandler = new SetLyPdfPropertiesHandler();
                isPropertiesSettingsUpdate = true;
                isLyPdfPropertiesUpdate = true;
                break;
            case FormNode.SAVE_OUTPUT_SETTINGS_BUTTON:
                taskInitializer = new OutputSettingsInitializer(taskForm);
                inputHandler = new SetOutputPropertiesHandler();
                isPropertiesSettingsUpdate = true;
                isOutputSettingsUpdate = true;
                break;
            case FormNode.EXECUTE_DB_ACTIONS_BUTTON:
                taskInitializer = new DbTablesInitializer(taskForm);
                inputHandler = new DatabaseHandler();
                break;
            case FormNode.EXECUTE_VALIDATE_BUTTON:
                taskInitializer = new ValidateXmlInitializer(taskForm);
                inputHandler = new ValidateXmlHandler();
                break;
            case FormNode.EXECUTE_CONVERT_BUTTON:
                taskInitializer = new ConvertInitializer(taskForm);
                switch (taskForm.getFromSelection()) {
                    case TaskConstants.CONVERSION_TYPE_MUSICXML:
                        switch (taskForm.getToSelection()) {
                            case TaskConstants.CONVERSION_TYPE_DATABASE:
                                inputHandler = new MusicXml2DbHandler();
                                isDbUpdate = true;
                                break;
                            case TaskConstants.CONVERSION_TYPE_LILYPOND:
                                inputHandler = new MusicXml2LyHandler();
                                break;
                            case TaskConstants.CONVERSION_TYPE_PDF:
                                inputHandler = new MusicXml2PdfHandler();
                                break;
                        }
                        break;
                    case TaskConstants.CONVERSION_TYPE_DATABASE:
                        switch (taskForm.getToSelection()) {
                            case TaskConstants.CONVERSION_TYPE_MUSICXML:
                                inputHandler = new Db2MusicXmlHandler();
                                break;
                            case TaskConstants.CONVERSION_TYPE_LILYPOND:
                                inputHandler = new Db2LyHandler();
                                break;
                            case TaskConstants.CONVERSION_TYPE_PDF:
                                inputHandler = new Db2PdfHandler();
                                break;
                        }
                        break;
                    case TaskConstants.CONVERSION_TYPE_LILYPOND:
                        if (TaskConstants.CONVERSION_TYPE_PDF.equals(taskForm.getToSelection())) {
                            inputHandler = new Ly2PdfHandler();
                        }
                        break;
                }
                break;
            case FormNode.EXECUTE_DELETE_BUTTON:
                taskInitializer = new DeleteScoreInitializer(taskForm);
                inputHandler = new DeleteScoreHandler();
                isDbUpdate = true;
                break;
        }

        try {
            if (taskInitializer != null && inputHandler != null) {
                taskForm.disableNodes(true);
                taskInitializer.initializeNodeMap();
                MusicXmlTask musicXmlTask = new MusicXmlTask(taskInitializer, inputHandler);
                musicXmlTask.execute();

                if (isPropertiesSettingsUpdate) Platform.runLater(PropertiesHandler::addLocalPropertiesBundle);
                if (isLyPdfPropertiesUpdate) Platform.runLater(() -> taskForm.handleLyPdfUpdates());
                if (isDbUpdate) Platform.runLater(() -> {taskForm.handleDisplayUpdates();});
                if (isOutputSettingsUpdate) Platform.runLater(() -> taskForm.resetOutputStream());
            }
            System.err.println("Task finished successfully");
        } catch (TaskException e) {
            System.err.println("Task exited with exception");
            System.err.println(e.getMessage());
        } finally {
            taskForm.disableNodes(false);
        }
    }
    </textarea>
</div>
