@echo off
echo ########################################################################
echo #                DSLan 1.3.7 Craked by OmaudosoXD (SDTeaM)             #
echo #----------------------------------------------------------------------#
echo # Copyright (c) 2007-2011 SpeeD TeaM (SDTeaM)                          #
echo #----------------------------------------------------------------------#
echo # Edition:                                                             #
echo #          Felipe de Freitas Medeiros  (felipe.lek.2010@hotmail.com)   #
echo ########################################################################
echo ------------------------------------------------------------------------
apache\bin\pv -f -k apache.exe -q
if not exist apache\logs\httpd.pid GOTO exit
del apache\logs\httpd.pid

:exit
