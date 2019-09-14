# -*- coding: utf-8 -*-
"""config dialog

Copyright (c) 2019 lileilei <hustlei@sina.cn>
"""

import os
from PyQt5.QtWidgets import (QApplication, QWidget, QHBoxLayout, QVBoxLayout, QListWidget, QStackedWidget, QGroupBox,
                             QLabel, QLineEdit, QSpinBox, QPushButton, QComboBox, QFormLayout)
from PyQt5.QtCore import Qt

class ConfDialog(QWidget):
    def __init__(self, mainwin):
        super(ConfDialog, self).__init__()
        self._app = QApplication.instance()  # 获取app实例
        self.setWindowFlags(Qt.Tool|Qt.WindowStaysOnTopHint)
        self.win=mainwin
        self.initUI()

    def initUI(self):
        mainLayout=QVBoxLayout()
        layH1=QHBoxLayout()
        layH2=QHBoxLayout()
        self.conflist=QListWidget()
        self.stack=QStackedWidget()
        layH1.addWidget(self.conflist)
        layH1.addWidget(self.stack)
        self.okbtn=QPushButton(self.tr("OK"))
        self.cancelbtn=QPushButton(self.tr("Cancel"))
        layH2.addStretch(1)
        layH2.addWidget(self.okbtn)
        layH2.addWidget(self.cancelbtn)
        mainLayout.addLayout(layH1)
        mainLayout.addLayout(layH2)
        self.setLayout(mainLayout)

        #list
        self.conflist.addItem(self.tr("General"))
        self.conflist.addItem(self.tr("Editor"))
        self.conflist.setMaximumWidth(150)
        #general
        w=QWidget()
        layw=QVBoxLayout()

        g=QGroupBox(self.tr("General"))
        glayout=QFormLayout()
        label1=QLabel(self.tr("select UI language:"))
        self.langCombo=QComboBox()
        self.langCombo.addItems(self.findLang())
        self.langCombo.setMinimumWidth(150)
        label2=QLabel(self.tr("Number of recent files:"))
        self.recentcountspin=QSpinBox()
        self.recentcountspin.setMinimum(1)
        self.recentcountspin.setMaximum(30)
        label3 = QLabel(self.tr("Font Size:"))
        self.fontsizespin = QSpinBox()
        self.fontsizespin.setMinimum(1)
        self.fontsizespin.setMaximum(30)

        glayout.addRow(label1,self.langCombo)
        glayout.addRow(label2,self.recentcountspin)
        glayout.addRow(label3,self.fontsizespin)
        g.setLayout(glayout)

        layw.addWidget(g)
        layw.addStretch(1)
        w.setLayout(layw)
        self.stack.addWidget(w)

        #editor
        from ui.editor.settings import EditorSettings
        w=EditorSettings(self.win.editor)
        self.stack.addWidget(w)

        self.conflist.currentRowChanged.connect(self.stack.setCurrentIndex)
        self.cancelbtn.clicked.connect(self.close)
        self.cancelbtn.setVisible(False)
        self.okbtn.clicked.connect(self.close)

        #action
        self.fontsizespin.valueChanged.connect(self.win.editor.font().setPointSize)
        def setCount(x):
            self.win.recent.maxcount=x
        self.recentcountspin.valueChanged.connect(setCount)
        self.langCombo.currentTextChanged.connect(self.chLang)

    def findLang(self):
        langs=["English"]
        dir=os.path.join(os.path.dirname(__file__),"i18n")
        for f in os.listdir(dir):
            if(f.startswith("i18n-") and f.endswith(".qm")):#os.path.isfile(file) and
                langs.append(f[5:-3])
        return langs

    def chLang(self,lang):
        # print("Change language to "+lang)
        # try:
        #     if lang.lower()=="english":
        #         self._app.removeTranslator(self.win.trans)
        #         return
        #     self.win.trans.load("i18n-"+lang+".qm")
        #     self._app.installTranslator(self.win.trans)
        #     #self._app.retranslateUi(self)# 重新翻译界面
        # except Exception as Argument:
        #     print(Argument)
        print("Setting Language to "+lang)
        self.win.config.getSec("general")["language"]=lang
        print("restart soft to enable.")

    def show(self):
        #default value
        self.fontsizespin.setValue(self.win.editor.font().pointSize())
        self.recentcountspin.setValue(self.win.recent.maxcount)
        lang=self.win.config.getSec("general").get("language",None)
        if lang==None:
            lang="English"
        if(lang in self.findLang()):
            self.langCombo.setCurrentText(lang)
        super().show()