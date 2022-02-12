#include <QCoreApplication>
#include <iostream>
#include <QTextStream>
#include <string>
#include <QDebug>

void do_cpp(void)
{
    std::string name;
    std::cout << "Please enter your name: \n";
    std::getline(std::cin, name);
    std::cout << "Hello " << name << "\n";
}

void do_qt(void)
{
    QTextStream qin(stdin);
    QTextStream qout(stdout);

    qout << "Please enter your name: \n";
    qout.flush();
    QString name = qin.readLine();
    qout << "Hello " << name << "\n";
    qout.flush();
}

void do_mixed(void)
{
    QTextStream qin(stdin);
    qInfo() << "Please enter your name: ";
    QString name = qin.readLine();
    qInfo() << "Hello" << name;
}

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    //do_cpp();
    //do_qt();
    //do_mixed();
    return a.exec();
}
