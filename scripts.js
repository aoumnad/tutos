function montrerMenu() {
    LeftPanel_ID.classList.add("visible");  // .toggle marche aussi
    const liens = document.querySelectorAll("#LeftPanelMenu_ID");
    liens.forEach(element => {
        element.addEventListener("click", () => {
            LeftPanel_ID.classList.remove("visible");
        });
    });
    document.getElementById('XIcon').addEventListener('click', function() {
        LeftPanel_ID.classList.remove("visible");
    });
}

async function CopyCode(button) {
    try {
        // Récupérer le code à partir de l'élément <code>
        const codeElement = button.parentElement.nextElementSibling.querySelector('code');
        const code = codeElement.innerText;

        // Utiliser l'API Clipboard pour copier le texte
        await navigator.clipboard.writeText(code);

        // Informer l'utilisateur que le code a été copié
        button.innerText = 'Code Copié';
        setTimeout(() => {
            button.innerText = 'Copier';
        }, 2000);
    } catch (err) {
        console.error('Échec de la copie : ', err);
    }
}