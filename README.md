Opdracht 4 — Includes en Imports

Verschil tussen import_tasks en include_tasks:

- Import_tasks laadt taken statisch tijdens het runnen van de playbook. Deze taken worden altijd uitgevoerd en zijn direct      zichtbaar bij het uitvoeren van de playbook.

- Include_tasks laadt taken dynamisch tijdens het runnen van de playbook. Dit is handig om dus te gebruiken bij loops of functies die onder conditionele voorwaarden moeten runnen. Ze worden dus niet altijd gerunt (alleen wanneer het ze gebraagt wordt). Hierdoor kunnen ze ook eenvoudig hergebruikt worden bij het schrijven van verschillende taken in een playbook.


Waarom zijn rollen handig?
- Rollen kunnen eenvoudig hergebruikt worden over verschillenden taken en zelfs playbooks.
- zo maken projecten overzichtelijk door taken, handlers en vars te scheiden.
