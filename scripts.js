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

function CopyCode(button) {
    // Find the <code> element that is a sibling of the button's parent
      const codeElement = button.parentElement.nextElementSibling.querySelector('code');
          // Get the text content of the <code> element
          const codeText = codeElement.innerText.trim();
          // Create a temporary textarea element to hold the text to copy
          const tempTextArea = document.createElement('textarea');
          // Set the value of the textarea to the code text
          tempTextArea.value = codeText;
          // Append the textarea to the body (it needs to be in the DOM to copy its content)
          document.body.appendChild(tempTextArea);
          // Select the content of the textarea
          tempTextArea.select();
          // Copy the selected content to the clipboard
          document.execCommand('copy');
          // Remove the temporary textarea from the DOM
          document.body.removeChild(tempTextArea);
          // Optionally, you can notify the user that the code has been copied
          //alert('Code copié dans le presse-papier !');
          button.textContent = "C'est fait !";
              setTimeout(function () {
                  button.textContent = "Copier";
                  //window.getSelection().removeAllRanges(); // Annuler la sélection  
              }, 1000);
  }