const hre = require("hardhat");

async function main() {
  // Contract Factory abrufen
  const IdentityVerification = await hre.ethers.getContractFactory("IdentityVerification");
  
  // Deployment starten
  const identityVerification = await IdentityVerification.deploy();

  // Sicherstellen, dass der Vertrag korrekt bereitgestellt wurde
  await identityVerification.waitForDeployment();

  // Die Adresse des bereitgestellten Vertrags ausgeben
  console.log(`IdentityVerification contract deployed to: ${await identityVerification.getAddress()}`);
}

// Fehlerbehandlung
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
